"""Reference and switch fixtures required by RTL's merged SDK callbacks."""
import unittest

from rtl_vm import Memory, Reference, equal, execute, is_zero, parse


class RtlVmTests(unittest.TestCase):
    def test_literal_multiplication_keeps_signed_int_width_and_aliasing(self):
        for value,literal,expected in [(15,1000,15000),(7,-2,-14),(1500000000,3,205032704),(-2147483648,-1,-2147483648)]:
            code=parse(f'mul-int/lit16 p0, p0, {literal}\nreturn p0')
            self.assertEqual(execute(code,{'p0':value},lambda *_:None),expected)

    def test_array_length_preserves_array_and_handles_register_aliasing(self):
        code=parse('array-length v0, p0\nreturn v0')
        alias=parse('array-length p0, p0\nreturn p0')
        for values in ([],[Reference({},'Ljava/lang/Object;'),None]):
            array=Reference(list(values),'[Ljava/lang/Object;')
            for program in (code,alias):
                self.assertEqual(execute(program,{'p0':array},lambda *_:None),len(values))
                self.assertEqual(array.value,values)
        for invalid in (0,None,Reference({},'Ljava/lang/Object;')):
            with self.assertRaisesRegex(AssertionError,'array'):
                execute(code,{'p0':invalid},lambda *_:None)

    def test_boolean_static_writes_are_visible_to_native_reads(self):
        memory=Memory(statics={'Lfixture/State;->ready:Z':1})
        code=parse('sput-boolean p0, Lfixture/State;->ready:Z\nsget-boolean v0, Lfixture/State;->ready:Z\nreturn v0')
        for value in (0,1):
            self.assertEqual(execute(code,{'p0':value},lambda *_:None,memory=memory),value)
    def test_class_literals_keep_identity_for_explicit_factory_monitors(self):
        memory = Memory()
        code = parse('const-class v0, Lfixture/Factory;\nmonitor-enter v0\nmonitor-exit v0\nreturn-object v0')
        value = execute(code, {}, lambda *_: None, memory=memory)
        self.assertIs(execute(code, {}, lambda *_: None, memory=memory), value)
        other = execute(parse('const-class v0, Lfixture/Other;\nreturn-object v0'), {}, lambda *_: None, memory=memory)
        self.assertIsNot(other, value)
        self.assertEqual(value.descriptor, 'Ljava/lang/Class;')

    def test_object_array_reads_preserve_identity_and_require_valid_indexes(self):
        value = Reference({}, 'Ljava/lang/Object;')
        array = Reference([value, None], '[Ljava/lang/Object;')
        code = parse('aget-object v0, p0, p1\nreturn-object v0')
        self.assertIs(execute(code, {'p0': array, 'p1': 0}, lambda *_: None), value)
        self.assertIsNone(execute(code, {'p0': array, 'p1': 1}, lambda *_: None))
        for index in (-1, 2):
            with self.assertRaisesRegex(AssertionError, 'array'):
                execute(code, {'p0': array, 'p1': index}, lambda *_: None)

    def test_smali_escaped_apostrophes_and_literal_backslashes(self):
        for literal, expected in [(r'''"call to \'resume\'"''', "call to 'resume'"),
                                  (r'''"slash \\\' quote"''', "slash \\' quote"),
                                  (r'''"literal \\\\ and \\\"quote"''', 'literal \\\\ and \\"quote')]:
            code = parse('const-string v0, ' + literal + '\nreturn-object v0')
            self.assertEqual(execute(code, {}, lambda *_: None), expected)

    def test_long_subtraction_retains_signed_width_and_source_pair(self):
        code=parse('sub-long/2addr v0, v2\nreturn-wide v0')
        for a,b,expected in [(9,12,-3),(12,9,3),(-2**63,1,2**63-1)]:
            registers={'v0':a,'v1':0,'v2':b,'v3':0}
            self.assertEqual(execute(code,registers,lambda *_:None),expected)
            self.assertEqual((registers['v1'],registers['v2'],registers['v3']),(0,b,0))
        with self.assertRaisesRegex(AssertionError,'long'):
            execute(code,{'v0':Reference({}),'v2':1},lambda *_:None)

    def test_static_object_writes_preserve_reference_identity_and_null(self):
        value = Reference({}, 'Lfixture/Result;')
        memory = Memory(statics={'Lfixture/Other;->value:Ljava/lang/Object;': value})
        code = parse('''
            sput-object p0, Lfixture/Enum;->FAILURE:Lfixture/Result;
            sget-object v0, Lfixture/Enum;->FAILURE:Lfixture/Result;
            return-object v0
        ''')
        self.assertIs(execute(code, {'p0': value}, lambda *_: None, memory=memory), value)
        self.assertEqual(execute(code, {'p0': 0}, lambda *_: None, memory=memory), 0)
        self.assertIs(memory.static('Lfixture/Other;->value:Ljava/lang/Object;'), value)

    def test_int_to_long_retains_signed_value_and_allocates_wide_pair(self):
        registers = {'p0': -1}
        self.assertEqual(execute(parse('int-to-long v0, p0\nreturn-wide v0'), registers, lambda *_: None), -1)
        self.assertIn('v1', registers)

    def test_monitor_balance_and_filled_reference_array(self):
        reference = Reference({}, 'Ljava/lang/Object;')
        code = parse('''
            monitor-enter p0
            filled-new-array {p0, p1}, [Ljava/lang/Object;
            move-result-object v0
            monitor-exit p0
            return-object v0
        ''')
        result = execute(code, {'p0': reference, 'p1': 0}, lambda *_: None)
        self.assertEqual(result.descriptor, '[Ljava/lang/Object;')
        self.assertIs(result.value[0], reference)
        with self.assertRaisesRegex(AssertionError, 'monitor'):
            execute(parse('monitor-exit p0\nreturn-void'), {'p0': reference}, lambda *_: None)

    def test_typed_exception_handlers_are_half_open_and_preserve_throwable(self):
        from rtl_vm import VmThrown
        failure = Reference({}, 'Lfixture/ParseError;')
        memory = Memory({'Lfixture/ParseError;': ('Ljava/lang/Exception;',)})
        program = parse('''
            :start
            throw p0
            :end
            return-void
            :handler
            move-exception v0
            return-object v0
            .catch Ljava/lang/Exception; {:start .. :end} :handler
        ''')
        self.assertIs(execute(program, {'p0': failure}, lambda *_: None, memory=memory), failure)
        outside = parse('''
            :start
            nop
            :end
            throw p0
            :handler
            move-exception v0
            return-object v0
            .catch Ljava/lang/Exception; {:start .. :end} :handler
        ''')
        with self.assertRaises(VmThrown):
            execute(outside, {'p0': failure}, lambda *_: None, memory=memory)

    def test_empty_references_and_boxed_false_are_nonnull(self):
        for value in ([], {}, '', b'', Reference(False)):
            self.assertFalse(is_zero(value))
        self.assertTrue(is_zero(0))
        self.assertTrue(is_zero(None))
        self.assertTrue(equal(0, None))

    def test_reference_comparisons_use_identity_and_primitives_use_value(self):
        a, b = [1], [1]
        self.assertTrue(equal(a, a))
        self.assertFalse(equal(a, b))
        a, b = Reference(False), Reference(False)
        self.assertFalse(equal(a, b))
        self.assertTrue(equal(9, 9))
        self.assertFalse(equal(0, Reference(False)))

    def test_packed_switch_targets_remain_explicit(self):
        program = parse('''
            packed-switch p0, :table
            const/4 v0, 0x0
            return v0
            :one
            const/4 v0, 0x1
            return v0
            :two
            const/4 v0, 0x2
            return v0
            :table
            .packed-switch 0x1
                :one
                :two
            .end packed-switch
        ''')
        self.assertEqual(len(program.instructions), 7)
        self.assertEqual(program.switches['table'], {1: 3, 2: 5})
        self.assertEqual(program.labels['one'], 3)

    def test_sparse_switch_values_and_targets_are_not_dropped(self):
        program = parse('''
            sparse-switch p0, :table
            return-void
            :first
            return-void
            :second
            return-void
            :table
            .sparse-switch
                0x1 -> :first
                0x9 -> :second
            .end sparse-switch
        ''')
        self.assertEqual(program.switches['table'], {1: 2, 9: 3})
        self.assertEqual(len(program.instructions), 4)

    def test_missing_or_duplicate_switch_targets_fail(self):
        with self.assertRaisesRegex(AssertionError, 'Missing switch target'):
            parse('''
                :table
                .packed-switch 0x0
                    :missing
                .end packed-switch
            ''')
        with self.assertRaisesRegex(AssertionError, 'Duplicate label'):
            parse(':same\nreturn-void\n:same\nreturn-void')

    def test_execution_uses_reference_and_switch_semantics(self):
        program = parse('''
            if-eqz p0, :null
            packed-switch p1, :table
            const/4 v0, 0x0
            return v0
            :one
            const/4 v0, 0x1
            return v0
            :null
            const/4 v0, -0x1
            return v0
            :table
            .packed-switch 0x1
                :one
            .end packed-switch
        ''')
        self.assertEqual(execute(program, {'p0': [], 'p1': 1}, lambda *_: None), 1)
        self.assertEqual(execute(program, {'p0': 0, 'p1': 1}, lambda *_: None), -1)
        with self.assertRaisesRegex(AssertionError, 'Unsupported RTL'):
            execute(parse('invent-success v0'), {}, lambda *_: None)

    def test_typed_native_result_and_field_writes_preserve_identity(self):
        result = Reference({}, 'Lrc;')
        state = Reference({}, 'Lstate;')
        memory = Memory({'Lrc;': ('Lpd;',), 'Lpd;': ('Ljava/lang/Object;',)},
                        {'Lrc;->a:Lrc;': result})
        code = parse('''
            sget-object v0, Lrc;->a:Lrc;
            instance-of v1, v0, Lpd;
            if-eqz v1, :end
            iput-object v0, p0, Lstate;->result:Ljava/lang/Object;
            iget-object v2, p0, Lstate;->result:Ljava/lang/Object;
            return-object v2
            :end
            const/4 v0, 0x0
            return-object v0
        ''')
        self.assertIs(execute(code, {'p0': state}, lambda *_: None, memory=memory), result)
        self.assertIs(state.value['Lstate;->result:Ljava/lang/Object;'], result)

    def test_allocations_and_casts_do_not_conflate_empty_references(self):
        memory = Memory()
        output = execute(parse('''
            const/4 v0, 0x0
            new-array v1, v0, [Ljava/lang/Object;
            if-eqz v1, :bad
            check-cast v1, [Ljava/lang/Object;
            return-object v1
            :bad
            return-object v0
        '''), {}, lambda *_: None, memory=memory)
        self.assertIsInstance(output, Reference)
        self.assertEqual(output.value, [])
        with self.assertRaisesRegex(AssertionError, 'RTL cast'):
            execute(parse('check-cast p0, Lwrong;\nreturn-void'), {'p0': output}, lambda *_: None, memory=memory)

    def test_bounded_execution_stops_before_unmodeled_external_region(self):
        state = {}
        result = execute(parse('const/4 v0, 0x8\ninvent-android-runtime v0'),
                         state, lambda *_: None, stop_at={1})
        self.assertEqual(result, 1)
        self.assertEqual(state['v0'], 8)

    def test_native_default_masks_and_signed_int_wrapping(self):
        program = parse('''
            and-int/lit8 v0, p0, 0x4
            or-int/lit16 v1, v0, 0x2000
            xor-int/lit8 v1, v1, 0x1
            sub-int/2addr v1, p1
            return v1
        ''')
        self.assertEqual(execute(program, {'p0': 15, 'p1': 1}, lambda *_: None), 8196)
        self.assertEqual(execute(parse('sub-int/2addr p0, p1\nreturn p0'),
                                 {'p0': 2147483647, 'p1': -1}, lambda *_: None), -2147483648)

    def test_wide_words_comparison_and_executed_instruction_audit(self):
        seen = []
        code = parse('''
            const-wide v0, 0x100000001L
            move-wide v2, v0
            cmp-long v4, v2, p0
            return v4
        ''')
        registers = {'p0': 0x100000000}
        self.assertEqual(execute(code, registers, lambda *_: None, trace=seen.append), 1)
        self.assertEqual((registers['v2'], registers['v3']), (0x100000001, 0))
        self.assertEqual(seen, code.instructions)

    def test_overlapping_wide_move_copies_both_words_before_writing(self):
        registers = {'v0': 123456789, 'v1': 0}
        self.assertEqual(execute(parse('move-wide v1, v0\nreturn-wide v1'),
                                 registers, lambda *_: None), 123456789)
        self.assertEqual(registers['v2'], 0)


if __name__ == '__main__':
    unittest.main()
