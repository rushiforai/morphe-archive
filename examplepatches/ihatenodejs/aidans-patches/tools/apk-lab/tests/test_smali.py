from __future__ import annotations

import subprocess
from unittest.mock import MagicMock

from apk_lab.smali import (
    parse_smali_register,
    validate_smali_snippet,
)
from apk_lab.tools import ToolManager


def test_register_mapping_instance_vs_static():
    # Instance method: locals=20, params=2 -> p0=v20 (this), p1=v21 (arg 1), p2=v22 (arg 2)
    reg_p0, err = parse_smali_register(
        "p0", 1, locals_count=20, parameter_count=2, is_static=False, total_registers=23
    )
    assert err is None
    assert reg_p0.index == 20
    assert reg_p0.is_param is True

    reg_p1, err = parse_smali_register(
        "p1", 1, locals_count=20, parameter_count=2, is_static=False, total_registers=23
    )
    assert err is None
    assert reg_p1.index == 21

    # p3 out of range for params=2
    _, err_p3 = parse_smali_register(
        "p3", 1, locals_count=20, parameter_count=2, is_static=False, total_registers=23
    )
    assert err_p3 is not None
    assert err_p3.code == "PARAMETER_OUT_OF_RANGE"

    # Static method: locals=20, params=2 -> p0=v20 (arg 1), p1=v21 (arg 2)
    reg_stat_p0, err = parse_smali_register(
        "p0", 1, locals_count=20, parameter_count=2, is_static=True, total_registers=22
    )
    assert err is None
    assert reg_stat_p0.index == 20

    reg_stat_p1, err = parse_smali_register(
        "p1", 1, locals_count=20, parameter_count=2, is_static=True, total_registers=22
    )
    assert err is None
    assert reg_stat_p1.index == 21

    # p2 out of range for static params=2
    _, err_stat_p2 = parse_smali_register(
        "p2", 1, locals_count=20, parameter_count=2, is_static=True, total_registers=22
    )
    assert err_stat_p2 is not None
    assert err_stat_p2.code == "PARAMETER_OUT_OF_RANGE"


def test_register_aliases_parameter_instance_method():
    report = validate_smali_snippet(
        "const/4 v1, 0x0",
        locals_count=1,
        parameter_count=1,
        is_static=False,
    )

    assert not report.is_valid
    error = report.diagnostics[0]
    assert error.code == "REGISTER_ALIASES_PARAMETER"
    assert "p0 (this)" in error.message


def test_register_aliases_parameter_static_method():
    report = validate_smali_snippet(
        "const/4 v1, 0x0",
        locals_count=1,
        parameter_count=2,
        is_static=True,
    )

    assert not report.is_valid
    error = report.diagnostics[0]
    assert error.code == "REGISTER_ALIASES_PARAMETER"
    assert "p0" in error.message


def test_valid_local_registers_no_aliasing():
    report = validate_smali_snippet(
        "const/4 v0, 0x0",
        locals_count=1,
        parameter_count=2,
        is_static=False,
    )

    assert report.is_valid


def test_validate_smali_format_22c_overflow_with_remediation():
    snippet = "instance-of v0, p1, Lcom/example/Target;"
    report = validate_smali_snippet(
        snippet=snippet,
        locals_count=20,
        parameter_count=2,
        is_static=False,
    )
    assert not report.is_valid
    errors = [d for d in report.diagnostics if d.severity == "error"]
    assert len(errors) == 1
    assert errors[0].code == "FORMAT_22C_REGISTER_OVERFLOW"
    assert "p1" in errors[0].message
    assert "v21" in errors[0].message
    assert "move-object/from16" in errors[0].message


def test_validate_smali_format_21c_valid():
    snippet = "check-cast v10, Lcom/example/Target;"
    report = validate_smali_snippet(
        snippet=snippet,
        locals_count=15,
        parameter_count=0,
        is_static=True,
    )
    assert report.is_valid


def test_validate_smali_const4_literal_range():
    # Valid -8..7
    rep_ok = validate_smali_snippet(
        "const/4 v0, 7", locals_count=5, parameter_count=0, is_static=True
    )
    assert rep_ok.is_valid

    rep_ok2 = validate_smali_snippet(
        "const/4 v0, -8", locals_count=5, parameter_count=0, is_static=True
    )
    assert rep_ok2.is_valid

    # Out of range: 8
    rep_err = validate_smali_snippet(
        "const/4 v0, 8", locals_count=5, parameter_count=0, is_static=True
    )
    assert not rep_err.is_valid
    err = rep_err.diagnostics[0]
    assert err.code == "CONST4_LITERAL_OUT_OF_RANGE"
    assert "const/16" in err.message


def test_validate_smali_invoke_35c_overflow():
    snippet = "invoke-virtual {v16}, Lcom/example/Target;->foo()V"
    report = validate_smali_snippet(
        snippet=snippet,
        locals_count=20,
        parameter_count=0,
        is_static=True,
    )
    assert not report.is_valid
    err = report.diagnostics[0]
    assert err.code == "INVOKE_35C_REGISTER_OVERFLOW"
    assert "invoke-virtual/range" in err.message


def test_missing_move_result_warning():
    snippet = """invoke-static {}, Lcom/example/Factory;->create()Ljava/lang/String;
const/4 v0, 0x0
"""
    report = validate_smali_snippet(
        snippet, locals_count=1, parameter_count=0, is_static=True
    )

    assert any(d.code == "MISSING_MOVE_RESULT" for d in report.diagnostics)


def test_valid_move_result_object():
    snippet = """invoke-static {}, Lcom/example/Factory;->create()Ljava/lang/String;
move-result-object v0
"""
    report = validate_smali_snippet(
        snippet, locals_count=1, parameter_count=0, is_static=True
    )

    assert not any(d.code == "MISSING_MOVE_RESULT" for d in report.diagnostics)


def test_move_result_with_debug_directives():
    snippet = """invoke-static {}, Lcom/example/Factory;->create()Ljava/lang/String;
.line 10
move-result-object v0
"""
    report = validate_smali_snippet(
        snippet, locals_count=1, parameter_count=0, is_static=True
    )
    assert not any(d.code == "ORPHAN_MOVE_RESULT" for d in report.diagnostics)
    assert not any(d.code == "MISSING_MOVE_RESULT" for d in report.diagnostics)
    assert report.is_valid


def test_orphan_move_result_error():
    snippet = """const/4 v0, 0x0
move-result-object v0
"""
    report = validate_smali_snippet(
        snippet, locals_count=1, parameter_count=0, is_static=True
    )

    assert not report.is_valid
    assert any(d.code == "ORPHAN_MOVE_RESULT" for d in report.diagnostics)


def test_invoke_custom_and_polymorphic_move_result():
    snippet = """invoke-custom {v0}, myCallSite()I, Lbsm;->metafactory()Ljava/lang/invoke/CallSite;
move-result v0
invoke-polymorphic {v0}, Ljava/lang/invoke/MethodHandle;->invoke([Ljava/lang/Object;)Ljava/lang/Object;, (I)Ljava/lang/String;
move-result-object v0
invoke-custom/range {v0 .. v0}, makeConcat()J, Lbsm;->bsm()Ljava/lang/invoke/CallSite;
move-result-wide v0
"""
    report = validate_smali_snippet(
        snippet, locals_count=2, parameter_count=0, is_static=True
    )
    assert not any(d.code == "ORPHAN_MOVE_RESULT" for d in report.diagnostics)
    assert not any(d.code == "INVALID_MOVE_RESULT" for d in report.diagnostics)


def test_invoke_custom_primitive_return_move_result():
    snippet = """invoke-custom {v0}, call_site_0("name", ()I)@Ljava/lang/invoke/LambdaMetafactory;->metafactory(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/CallSite;
move-result v0
"""
    report = validate_smali_snippet(
        snippet, locals_count=1, parameter_count=0, is_static=True
    )
    assert not any(d.code == "ORPHAN_MOVE_RESULT" for d in report.diagnostics)
    assert not any(d.code == "INVALID_MOVE_RESULT" for d in report.diagnostics)
    assert report.is_valid


def test_move_result_after_void_invoke_error():
    snippet = """invoke-static {}, Lcom/example/Target;->foo()V
move-result v0
"""
    report = validate_smali_snippet(
        snippet, locals_count=1, parameter_count=0, is_static=True
    )
    assert not report.is_valid
    assert any(
        d.code == "INVALID_MOVE_RESULT" and "void" in d.message
        for d in report.diagnostics
    )


def test_move_result_variant_mismatch_error():
    # Returning primitive int but captured with move-result-object
    snippet = """invoke-static {}, Lcom/example/Target;->getCount()I
move-result-object v0
"""
    report = validate_smali_snippet(
        snippet, locals_count=1, parameter_count=0, is_static=True
    )
    assert not report.is_valid
    assert any(
        d.code == "INVALID_MOVE_RESULT" and "move-result" in d.message
        for d in report.diagnostics
    )


def test_filled_new_array_move_result_validation():
    # Valid move-result-object after filled-new-array
    snippet_ok = """filled-new-array {v0}, [I
move-result-object v0
"""
    rep_ok = validate_smali_snippet(
        snippet_ok, locals_count=1, parameter_count=0, is_static=True
    )
    assert not any(d.code == "INVALID_MOVE_RESULT" for d in rep_ok.diagnostics)

    # Invalid move-result after filled-new-array
    snippet_err = """filled-new-array {v0}, [I
move-result v0
"""
    rep_err = validate_smali_snippet(
        snippet_err, locals_count=1, parameter_count=0, is_static=True
    )
    assert not rep_err.is_valid
    assert any(
        d.code == "INVALID_MOVE_RESULT" and "move-result-object" in d.message
        for d in rep_err.diagnostics
    )


def test_validate_smali_missing_and_duplicate_labels():
    # Missing label
    rep_missing = validate_smali_snippet(
        "goto :undefined", locals_count=1, parameter_count=0, is_static=True
    )
    assert not rep_missing.is_valid
    assert rep_missing.diagnostics[0].code == "MISSING_BRANCH_TARGET"

    # Duplicate label
    snippet_dup = """:my_label
const/4 v0, 1
:my_label
return-void
"""
    rep_dup = validate_smali_snippet(
        snippet_dup, locals_count=1, parameter_count=0, is_static=True
    )
    assert not rep_dup.is_valid
    assert rep_dup.diagnostics[0].code == "DUPLICATE_LABEL"


def test_validate_smali_cfg_unreachable_and_backward_edge():
    snippet = """goto :end
const/4 v0, 1
:end
if-eqz v0, :end
return-void
"""
    report = validate_smali_snippet(
        snippet, locals_count=2, parameter_count=0, is_static=True
    )
    # Valid because warnings don't make is_valid False
    assert report.is_valid

    warnings = [d for d in report.diagnostics if d.severity == "warning"]
    codes = {w.code for w in warnings}
    assert "UNREACHABLE_CODE" in codes
    assert "BACKWARD_BRANCH" in codes


def test_validate_smali_cfg_closed_cycle_warning():
    snippet = """:loop
add-int/lit8 v0, v0, 1
goto :loop
"""
    report = validate_smali_snippet(
        snippet, locals_count=2, parameter_count=0, is_static=True
    )
    assert report.is_valid
    warnings = [d for d in report.diagnostics if d.severity == "warning"]
    codes = {w.code for w in warnings}
    assert "POSSIBLE_CLOSED_CYCLE" in codes


def test_validate_smali_assembler_oracle_line_adjustment():
    tm = MagicMock(spec=ToolManager)
    tm.is_tool_installed.return_value = True

    # Smali assemble output reporting error on line 6 (header is 4 lines, so snippet line is 2)
    err_out = "Synthetic.smali:[6,4] Invalid instruction 'bad_opcode'\n"
    tm.run_tool_cmd.return_value = subprocess.CompletedProcess([], 1, "", err_out)

    snippet = """const/4 v0, 1
bad_opcode
"""
    report = validate_smali_snippet(
        snippet, locals_count=1, parameter_count=0, is_static=True, tool_manager=tm
    )
    assert not report.is_valid
    err = next(d for d in report.diagnostics if d.code == "ASSEMBLER_SYNTAX_ERROR")
    assert err.line == 2
    assert "bad_opcode" in err.message


def test_validate_smali_comment_stripping_with_hash_in_string():
    from apk_lab.smali import strip_smali_comment

    line = 'const-string v0, "Hello # world, test" # real comment'
    stripped = strip_smali_comment(line)
    assert stripped == 'const-string v0, "Hello # world, test"'

    snippet = 'const-string v0, "Hello # world" # comment'
    report = validate_smali_snippet(
        snippet, locals_count=1, parameter_count=0, is_static=True
    )
    assert report.is_valid


def test_validate_smali_method_descriptor_wide_types():
    # Descriptor (IJ)V -> I is 1 register, J is 2 registers -> total 3 param registers
    # Static method: p0=I, p1,p2=J -> total 3 param registers. With locals=2:
    # v0, v1 = locals. p0 = v2, p1 = v3, p2 = v4.
    snippet = """
move-wide/from16 v0, p1
"""
    report = validate_smali_snippet(
        snippet,
        locals_count=2,
        is_static=True,
        descriptor="(IJ)V",
    )
    assert report.is_valid
    assert report.params_count == 3
    assert report.total_registers == 5


def test_validate_smali_indented_label():
    snippet = """
    :again
    const/4 v0, 0
    goto :again
"""
    report = validate_smali_snippet(
        snippet, locals_count=1, parameter_count=0, is_static=True
    )
    assert report.is_valid
    assert not any(d.code == "MISSING_BRANCH_TARGET" for d in report.diagnostics)


def test_validate_smali_method_descriptor_validation():
    import pytest

    snippet = "return-void"

    # Missing return type
    with pytest.raises(ValueError, match="Invalid method descriptor"):
        validate_smali_snippet(
            snippet, locals_count=0, is_static=True, descriptor="(I)"
        )

    # Trailing characters after return type
    with pytest.raises(ValueError, match="Invalid method descriptor"):
        validate_smali_snippet(
            snippet, locals_count=0, is_static=True, descriptor="(I)V extra"
        )

    with pytest.raises(ValueError, match="Invalid method descriptor"):
        validate_smali_snippet(
            snippet, locals_count=0, is_static=True, descriptor="(I)VX"
        )

    # Explicitly empty descriptor
    with pytest.raises(ValueError, match="Invalid method descriptor"):
        validate_smali_snippet(snippet, locals_count=0, is_static=True, descriptor="")

    # Valid descriptors
    r1 = validate_smali_snippet(
        snippet, locals_count=0, is_static=True, descriptor="()V"
    )
    assert r1.is_valid

    r2 = validate_smali_snippet(
        snippet,
        locals_count=0,
        is_static=True,
        descriptor="(ILjava/lang/String;)[I",
    )
    assert r2.is_valid
    assert r2.params_count == 2


def test_validate_smali_assembler_oracle_unparsed_failure():
    tm = MagicMock(spec=ToolManager)
    tm.is_tool_installed.return_value = True

    # Nonzero exit code with unformatted/fatal error output
    err_out = "FATAL: Out of memory during assembly\n"
    tm.run_tool_cmd.return_value = subprocess.CompletedProcess([], 1, "", err_out)

    snippet = "const/4 v0, 1"
    report = validate_smali_snippet(
        snippet, locals_count=1, parameter_count=0, is_static=True, tool_manager=tm
    )
    assert not report.is_valid
    err = next(d for d in report.diagnostics if d.code == "ASSEMBLER_ERROR")
    assert err.line == 1
    assert "Out of memory" in err.message
