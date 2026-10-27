.class public final Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$2;
.super LX/9V4;
.implements LX/0Sq;

.method public final invoke(LX/2Os;I)LX/9IF;
    .locals 58
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LX/2Os;",
            "I)",
            "LX/9IF<",
            "Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;",
            ">;"
        }
    .end annotation

    .line 0
    const v0, 0x63ae5862

    .line 1
    .line 2
    .line 3
    move-object/from16 v4, p1

    .line 4
    .line 5
    invoke-interface {v4, v0}, LX/2Os;->AfG(I)V

    .line 6
    .line 7
    .line 8
    move-object/from16 v1, p0

    .line 9
    .line 10
    iget-object v0, v1, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$2;->$onOpenOverlayConfigs:Lkotlin/jvm/functions/Function0;

    .line 11
    .line 12
    const/16 v33, 0x2

    .line 13
    .line 14
    const/4 v15, 0x1

    .line 15
    const/4 v6, 0x0

    .line 16
    const/16 v47, 0x3

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v7, v1, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$2;->$overlayConfigsMenuItem:Ljava/lang/String;

    .line 21
    .line 22
    const/4 v8, 0x0

    .line 23
    sget-object v17, LX/2hz;->A00:LX/2i0;

    .line 24
    .line 25
    new-instance v5, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    .line 26
    .line 27
    move-object v9, v8

    .line 28
    move-object v10, v8

    .line 29
    move-object v11, v8

    .line 30
    move v12, v6

    .line 31
    move v13, v6

    .line 32
    move v14, v6

    .line 33
    move/from16 v16, v6

    .line 34
    .line 35
    move/from16 v18, v15

    .line 36
    .line 37
    move/from16 v19, v15

    .line 38
    .line 39
    invoke-direct/range {v5 .. v19}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/2QG;LX/FMb;LX/2QG;ZZZZZLX/2hz;II)V

    .line 40
    .line 41
    .line 42
    iget-object v0, v1, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$2;->$forceRefreshMenuItem:Ljava/lang/String;

    .line 43
    .line 44
    new-instance v3, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    .line 45
    .line 46
    move-object/from16 v21, v8

    .line 47
    .line 48
    move-object/from16 v22, v8

    .line 49
    .line 50
    move-object/from16 v23, v8

    .line 51
    .line 52
    move-object/from16 v24, v8

    .line 53
    .line 54
    move/from16 v25, v6

    .line 55
    .line 56
    move/from16 v26, v6

    .line 57
    .line 58
    move/from16 v27, v6

    .line 59
    .line 60
    move/from16 v28, v15

    .line 61
    .line 62
    move/from16 v29, v6

    .line 63
    .line 64
    move-object/from16 v30, v17

    .line 65
    .line 66
    move/from16 v31, v15

    .line 67
    .line 68
    move/from16 v32, v15

    .line 69
    .line 70
    move-object/from16 v18, v3

    .line 71
    .line 72
    move-object/from16 v20, v0

    .line 73
    .line 74
    invoke-direct/range {v18 .. v32}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/2QG;LX/FMb;LX/2QG;ZZZZZLX/2hz;II)V

    .line 75
    .line 76
    .line 77
    iget-object v0, v1, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$2;->$forceEmergencyPushMenuItem:Ljava/lang/String;

    .line 78
    .line 79
    new-instance v2, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    .line 80
    .line 81
    move-object/from16 v34, v0

    .line 82
    .line 83
    move-object/from16 v35, v8

    .line 84
    .line 85
    move-object/from16 v36, v8

    .line 86
    .line 87
    move-object/from16 v37, v8

    .line 88
    .line 89
    move-object/from16 v38, v8

    .line 90
    .line 91
    move/from16 v39, v6

    .line 92
    .line 93
    move/from16 v40, v6

    .line 94
    .line 95
    move/from16 v41, v6

    .line 96
    .line 97
    move/from16 v42, v15

    .line 98
    .line 99
    move/from16 v43, v6

    .line 100
    .line 101
    move-object/from16 v44, v17

    .line 102
    .line 103
    move/from16 v45, v15

    .line 104
    .line 105
    move/from16 v46, v15

    .line 106
    .line 107
    move-object/from16 v32, v2

    .line 108
    .line 109
    invoke-direct/range {v32 .. v46}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/2QG;LX/FMb;LX/2QG;ZZZZZLX/2hz;II)V

    .line 110
    .line 111
    .line 112
    iget-object v1, v1, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$2;->$clearOverridesMenuItem:Ljava/lang/String;

    .line 113
    .line 114
    new-instance v0, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    .line 115
    .line 116
    move-object/from16 v46, v0

    .line 117
    .line 118
    move-object/from16 v48, v1

    .line 119
    .line 120
    move-object/from16 v49, v8

    .line 121
    .line 122
    move-object/from16 v50, v8

    .line 123
    .line 124
    move-object/from16 v51, v8

    .line 125
    .line 126
    move-object/from16 v52, v8

    .line 127
    .line 128
    move/from16 v53, v6

    .line 129
    .line 130
    move/from16 v54, v6

    .line 131
    .line 132
    move/from16 v55, v6

    .line 133
    .line 134
    move/from16 v56, v15

    .line 135
    .line 136
    move/from16 v57, v15

    .line 137
    .line 138
    move-object/from16 p0, v17

    .line 139
    .line 140
    move/from16 p1, v15

    .line 141
    .line 142
    move/from16 p2, v15

    .line 143
    .line 144
    invoke-direct/range {v46 .. v60}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/2QG;LX/FMb;LX/2QG;ZZZZZLX/2hz;II)V

    new-instance v7, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    const/4 v8, 0x4

    const-string v9, "Export modified flags"

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x1

    const/16 v18, 0x0

    sget-object v19, LX/2hz;->A00:LX/2i0;

    const/16 v20, 0x1

    const/16 v21, 0x1

    invoke-direct/range {v7 .. v21}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/2QG;LX/FMb;LX/2QG;ZZZZZLX/2hz;II)V

    new-instance v22, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    const/16 v23, 0x5

    const-string v24, "Import flags"

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x1

    const/16 v33, 0x0

    sget-object v34, LX/2hz;->A00:LX/2i0;

    const/16 v35, 0x1

    const/16 v36, 0x1

    invoke-direct/range {v22 .. v36}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/2QG;LX/FMb;LX/2QG;ZZZZZLX/2hz;II)V

    move-object/from16 v38, v7

    move-object/from16 v39, v22

    const/16 v7, 0x6

    new-array v7, v7, [Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    const/4 v8, 0x0

    aput-object v5, v7, v8

    const/4 v8, 0x1

    aput-object v3, v7, v8

    const/4 v8, 0x2

    aput-object v2, v7, v8

    const/4 v8, 0x3

    aput-object v0, v7, v8

    const/4 v8, 0x4

    aput-object v38, v7, v8

    const/4 v8, 0x5

    aput-object v39, v7, v8

    move-object v0, v7

    .line 145
    .line 146
    .line 147
    .line 151
    :goto_0
    invoke-static {v0}, LX/9I0;->A07([Ljava/lang/Object;)LX/9IE;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    invoke-static {v4}, LX/001;->A1P(Ljava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    return-object v0

    .line 159
    :cond_0
    iget-object v0, v1, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$2;->$forceRefreshMenuItem:Ljava/lang/String;

    .line 160
    .line 161
    const/16 v17, 0x0

    .line 162
    .line 163
    sget-object v26, LX/2hz;->A00:LX/2i0;

    .line 164
    .line 165
    new-instance v3, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    .line 166
    .line 167
    move-object v14, v3

    .line 168
    move-object/from16 v16, v0

    .line 169
    .line 170
    move-object/from16 v18, v17

    .line 171
    .line 172
    move-object/from16 v19, v17

    .line 173
    .line 174
    move-object/from16 v20, v17

    .line 175
    .line 176
    move/from16 v21, v6

    .line 177
    .line 178
    move/from16 v22, v6

    .line 179
    .line 180
    move/from16 v23, v6

    .line 181
    .line 182
    move/from16 v24, v15

    .line 183
    .line 184
    move/from16 v25, v6

    .line 185
    .line 186
    move/from16 v27, v15

    .line 187
    .line 188
    move/from16 v28, v15

    .line 189
    .line 190
    invoke-direct/range {v14 .. v28}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/2QG;LX/FMb;LX/2QG;ZZZZZLX/2hz;II)V

    .line 191
    .line 192
    .line 193
    iget-object v0, v1, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$2;->$forceEmergencyPushMenuItem:Ljava/lang/String;

    .line 194
    .line 195
    new-instance v2, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    .line 196
    .line 197
    move-object/from16 v27, v2

    .line 198
    .line 199
    move/from16 v28, v33

    .line 200
    .line 201
    move-object/from16 v29, v0

    .line 202
    .line 203
    move-object/from16 v31, v17

    .line 204
    .line 205
    move-object/from16 v32, v17

    .line 206
    .line 207
    move-object/from16 v33, v17

    .line 208
    .line 209
    move/from16 v34, v6

    .line 210
    .line 211
    move/from16 v35, v6

    .line 212
    .line 213
    move/from16 v36, v6

    .line 214
    .line 215
    move/from16 v37, v15

    .line 216
    .line 217
    move/from16 v38, v6

    .line 218
    .line 219
    move/from16 v40, v15

    .line 220
    .line 221
    move/from16 v41, v15

    .line 222
    .line 223
    move-object/from16 v30, v17

    .line 224
    .line 225
    move-object/from16 v39, v26

    .line 226
    .line 227
    invoke-direct/range {v27 .. v41}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/2QG;LX/FMb;LX/2QG;ZZZZZLX/2hz;II)V

    .line 228
    .line 229
    .line 230
    iget-object v1, v1, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$2;->$clearOverridesMenuItem:Ljava/lang/String;

    .line 231
    .line 232
    new-instance v0, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    .line 233
    .line 234
    move-object/from16 v27, v0

    .line 235
    .line 236
    move/from16 v28, v47

    .line 237
    .line 238
    move-object/from16 v29, v1

    .line 239
    .line 240
    move/from16 v38, v15

    .line 241
    .line 242
    invoke-direct/range {v27 .. v41}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/2QG;LX/FMb;LX/2QG;ZZZZZLX/2hz;II)V

    new-instance v7, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    const/4 v8, 0x4

    const-string v9, "Export modified flags"

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x1

    const/16 v18, 0x0

    sget-object v19, LX/2hz;->A00:LX/2i0;

    const/16 v20, 0x1

    const/16 v21, 0x1

    invoke-direct/range {v7 .. v21}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/2QG;LX/FMb;LX/2QG;ZZZZZLX/2hz;II)V

    new-instance v22, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    const/16 v23, 0x5

    const-string v24, "Import flags"

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x1

    const/16 v33, 0x0

    sget-object v34, LX/2hz;->A00:LX/2i0;

    const/16 v35, 0x1

    const/16 v36, 0x1

    invoke-direct/range {v22 .. v36}, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;-><init>(ILjava/lang/String;Ljava/lang/String;LX/2QG;LX/FMb;LX/2QG;ZZZZZLX/2hz;II)V

    move-object/from16 v38, v7

    move-object/from16 v39, v22

    const/4 v7, 0x5

    new-array v7, v7, [Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;

    const/4 v8, 0x0

    aput-object v3, v7, v8

    const/4 v8, 0x1

    aput-object v2, v7, v8

    const/4 v8, 0x2

    aput-object v0, v7, v8

    const/4 v8, 0x3

    aput-object v38, v7, v8

    const/4 v8, 0x4

    aput-object v39, v7, v8

    move-object v0, v7

    .line 243
    .line 244
    .line 245
    .line 249
    goto/16 :goto_0
.end method
