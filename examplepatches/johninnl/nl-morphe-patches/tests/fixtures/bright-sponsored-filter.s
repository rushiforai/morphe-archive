.text
// Linked virtual address: 0x4549ec
.org 0x4549ec
sponsored_filter:
ldur x16, [x29, #-0x68]
cmp w16, w22
b.eq pass
ldur w16, [x16, #0x3b]
cmp w16, w22
b.eq pass
tbz w16, #0, pass
add x16, x16, x28, lsl #32
ldur x17, [x16, #-1]
ubfx x17, x17, #12, #20
cmp x17, #398
b.ne pass
ldur w16, [x16, #0xf]
cmp w16, w22
b.eq pass
tbz w16, #0, pass
add x16, x16, x28, lsl #32
ldur x17, [x16, #-1]
ubfx x17, x17, #12, #20
cmp x17, #94
b.eq one_byte
cmp x17, #95
b.ne pass
two_byte:
ldur w17, [x16, #7]
cmp w17, #22
b.ne pass
ldurh w17, [x16, #15]
cmp w17, #97
b.ne pass
ldurh w17, [x16, #17]
cmp w17, #100
b.ne pass
ldurh w17, [x16, #19]
cmp w17, #118
b.ne pass
ldurh w17, [x16, #21]
cmp w17, #101
b.ne pass
ldurh w17, [x16, #23]
cmp w17, #114
b.ne pass
ldurh w17, [x16, #25]
cmp w17, #116
b.ne pass
ldurh w17, [x16, #27]
cmp w17, #111
b.ne pass
ldurh w17, [x16, #29]
cmp w17, #114
b.ne pass
ldurh w17, [x16, #31]
cmp w17, #105
b.ne pass
ldurh w17, [x16, #33]
cmp w17, #97
b.ne pass
ldurh w17, [x16, #35]
cmp w17, #108
b.ne pass
.word 0x14000000 | (((0x49a018 - 0x4549ec - (. - sponsored_filter)) >> 2) & 0x3ffffff)
one_byte:
ldur w17, [x16, #7]
cmp w17, #22
b.ne pass
ldurb w17, [x16, #15]
cmp w17, #97
b.ne pass
ldurb w17, [x16, #16]
cmp w17, #100
b.ne pass
ldurb w17, [x16, #17]
cmp w17, #118
b.ne pass
ldurb w17, [x16, #18]
cmp w17, #101
b.ne pass
ldurb w17, [x16, #19]
cmp w17, #114
b.ne pass
ldurb w17, [x16, #20]
cmp w17, #116
b.ne pass
ldurb w17, [x16, #21]
cmp w17, #111
b.ne pass
ldurb w17, [x16, #22]
cmp w17, #114
b.ne pass
ldurb w17, [x16, #23]
cmp w17, #105
b.ne pass
ldurb w17, [x16, #24]
cmp w17, #97
b.ne pass
ldurb w17, [x16, #25]
cmp w17, #108
b.ne pass
.word 0x14000000 | (((0x49a018 - 0x4549ec - (. - sponsored_filter)) >> 2) & 0x3ffffff)
pass:
ldur x1, [x29, #-0x30]
.word 0x14000000 | (((0x499fcc - 0x4549ec - (. - sponsored_filter)) >> 2) & 0x3ffffff)
sponsored_filter_end:
