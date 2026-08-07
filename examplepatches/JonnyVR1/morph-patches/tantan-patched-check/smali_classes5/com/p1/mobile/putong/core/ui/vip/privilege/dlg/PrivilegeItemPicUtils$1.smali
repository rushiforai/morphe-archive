.class Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeItemPicUtils$1;
.super Ljava/util/HashMap;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeItemPicUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 5
    .line 6
    new-instance v1, Ll/pf60;

    .line 7
    .line 8
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IlM2T08yRjI0UkxWWUo3WEdIVEhYWUtBVUdKMkFXNDE0IiwidyI6NTcxLCJoIjo1NzEsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozODI5NDkwMjQ3MDMwNjA3ODczfQ.png"

    .line 9
    .line 10
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6IkRHVERGNVhMWEhLVURONFJQVEJXWEpZQllRVEYyQjE0IiwidyI6NTcxLCJoIjo1NzEsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyNjk2ODMwNTE3ODA0NjIwMzAxfQ.png"

    .line 11
    .line 12
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 19
    .line 20
    new-instance v1, Ll/pf60;

    .line 21
    .line 22
    const-string v2, "https://static.tancdn.com/pe-webplatform/-nffpUlMSA8amV8Cf6U2HzKU.webp?format=originalOFGHLERTH"

    .line 23
    .line 24
    const-string v3, "https://static.tancdn.com/pe-webplatform/zzrXSpsuEpYBZkVNDVfoo0Y_.webp?format=originalOFGHLERTH"

    .line 25
    .line 26
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 33
    .line 34
    new-instance v1, Ll/pf60;

    .line 35
    .line 36
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6Ilg0TUhZMkVCTTJOWTZLN082NFk0NDRBTTZFRDdCSTEzIiwidyI6NTIyLCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3MDkxMzkwMTg3MTY3MDkzNzA4fQ.png?format=originalOFGHLERTH"

    .line 37
    .line 38
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6IkVCWlNYWVBWUE41NEY3MzNRSVU2RjVJTVM0SUk1NjEzIiwidyI6NTIyLCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3NjcwMTY4NTM5Mzg3OTg3OTEyfQ.png?format=originalOFGHLERTH"

    .line 39
    .line 40
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 47
    .line 48
    new-instance v1, Ll/pf60;

    .line 49
    .line 50
    const-string v2, "https://static.tancdn.com/pe-webplatform/p-F-pqINMrLr8OAVqg7hOhIQ.webp?format=originalOFGHLERTH"

    .line 51
    .line 52
    invoke-direct {v1, v2, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->message_read_state:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 59
    .line 60
    new-instance v1, Ll/pf60;

    .line 61
    .line 62
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IktKVFZMQ0ozWUI2T1FVS1JVNE42SUtVVVVRUjYySjEzIiwidyI6NTgyLCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4MDM2MDA4MzYxNjMwNTY4MjI0fQ.png?format=originalOFGHLERTH"

    .line 63
    .line 64
    invoke-direct {v1, v2, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->advanced_filter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 71
    .line 72
    new-instance v1, Ll/pf60;

    .line 73
    .line 74
    const-string v2, "https://static.tancdn.com/pe-webplatform/7A9Al8H2FFSbExv1GqFsr1MG.webp?format=originalOFGHLERTH"

    .line 75
    .line 76
    invoke-direct {v1, v2, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->letter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 83
    .line 84
    new-instance v1, Ll/pf60;

    .line 85
    .line 86
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IkNSNjRBSE1ZN1lDNlcyNU1GQkFQUldQWVlCWUZUSjA5IiwidyI6NTcwLCJoIjo1NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyNjg3OTIwMTYwNjY0NzkxODIzfQ.png?format=originalOFGHLERTH"

    .line 87
    .line 88
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6IlZWS0k2VlFKQUhJRUYzQzNQQkozQ1dLNzZNQ1BQWjA4IiwidyI6NTcwLCJoIjo1NzAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyNjkyNDA2MTg1NTIzMDkxNzM1fQ.png?format=originalOFGHLERTH"

    .line 89
    .line 90
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->privacy_membership:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 97
    .line 98
    new-instance v1, Ll/pf60;

    .line 99
    .line 100
    const-string v2, "https://static.tancdn.com/pe-webplatform/2Y_TCeZeRoq53Wo6fu4bp2Ix.webp?format=originalOFGHLERTH"

    .line 101
    .line 102
    const-string v3, "https://static.tancdn.com/pe-webplatform/ElFZesMjN6fcDzt8NmzOmhlv.webp?format=originalOFGHLERTH"

    .line 103
    .line 104
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->recover_unmatches:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 111
    .line 112
    new-instance v1, Ll/pf60;

    .line 113
    .line 114
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IkE3VDJHQlNaRE01QUpDSldINFhNR1JJTEZEQzNISTEyIiwidyI6NTM5LCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4ODgyNjEzOTY2MzAzMTM3MzQ0fQ.png?format=originalOFGHLERTH"

    .line 115
    .line 116
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6IlNFWE43U0YyUTJDUUZCVkVYQzM3VjVSQ1NQR1ZKNDEzIiwidyI6NTM5LCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4ODg3MjMyOTk4MDQ2MDQ0MDAwfQ.png?format=originalOFGHLERTH"

    .line 117
    .line 118
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 125
    .line 126
    new-instance v1, Ll/pf60;

    .line 127
    .line 128
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IldKWlFVVVRQSEpJM0FGN1lTRlU1UFJaUjI0RVA0MjEyIiwidyI6NTMxLCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyNjk0MzIwNDAxMTA5MzEwMjA4fQ.png?format=originalOFGHLERTH"

    .line 129
    .line 130
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6IlFNNklaUEQ2VUxDSTU1VVpIS1YzRzdSVVhFRk43RDEyIiwidyI6NTMxLCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMjcwNzk0Mzg1NzAzNjU2MTkyfQ.png?format=originalOFGHLERTH"

    .line 131
    .line 132
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->online_match_tickets:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 139
    .line 140
    new-instance v1, Ll/pf60;

    .line 141
    .line 142
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IkhXU05SUFo2VUQ1UlFNSkw1S1JSQkROQ1U2WjJGTTEyIiwidyI6NTMxLCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo5MTE3NjM0OTc2NzM4OTY4NDUyfQ.png?format=originalOFGHLERTH"

    .line 143
    .line 144
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6IldQQ0MyM0xOMlBQWFVVQkxYSDdYN1lQR1pDQ1BIQjEzIiwidyI6NTMxLCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo5MTE3NjM1MDEwOTY0NDg5MDg4fQ.png?format=originalOFGHLERTH"

    .line 145
    .line 146
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->online_match_tickets_oDiamond:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 153
    .line 154
    new-instance v1, Ll/pf60;

    .line 155
    .line 156
    const-string v2, "https://auto.tancdn.com/v1/raw/5a97d270-ec59-4f40-8810-488a1a60018812.webp"

    .line 157
    .line 158
    invoke-direct {v1, v2, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->voice_quick_chat:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 165
    .line 166
    new-instance v1, Ll/pf60;

    .line 167
    .line 168
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IkpDTlhZMk9IUUFISE42SVRMVlhGT0VVWDNDTTZKMjEzIiwidyI6NjA2LCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNDE4NzcxNjMyNzczNDkxMjk4NH0.png?format=originalOFGHLERTH"

    .line 169
    .line 170
    invoke-direct {v1, v2, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 177
    .line 178
    new-instance v1, Ll/pf60;

    .line 179
    .line 180
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IlpGN1k1QlBSQlpDNVhOQzZSSVdKVkFDT0hIWlZGTjEyIiwidyI6NTMxLCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTc4MjU4ODY3NjQwNjY5MjEyfQ.png?format=originalOFGHLERTH"

    .line 181
    .line 182
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik82WDdLV1BPQU8zTkdLSkQ3VDZUNlZUVExEWkw0UzEzIiwidyI6NTMxLCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTc2NDY0NDQ2NzMyMTk1MzU2fQ.png?format=originalOFGHLERTH"

    .line 183
    .line 184
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 191
    .line 192
    new-instance v1, Ll/pf60;

    .line 193
    .line 194
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IjRaS1ZIQ1VGNEw3SjJXN0pQSVpKQVRRQkVJQTNZNDEyIiwidyI6NDg5LCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMDI5NjYwNDAwODY0ODI5MjYxNX0.png?format=originalOFGHLERTH"

    .line 195
    .line 196
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6IkFFWVlSTk5aWFhaQUc3NFRGRVdXNk9LSEFJRkJVWDEzIiwidyI6NDg5LCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMDI5NTQ4MDIxMzgzMTIzMDc1M30.png?format=originalOFGHLERTH"

    .line 197
    .line 198
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->picksMembership:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 205
    .line 206
    new-instance v1, Ll/pf60;

    .line 207
    .line 208
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IjVRUUk3UzUzTUpKS1JTRzJTTlBRQkdZRzMyNlhYNzEzIiwidyI6NTMxLCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4NjM1MzQxODUyOTI2MDkwNzU1fQ.png?format=originalOFGHLERTH"

    .line 209
    .line 210
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6IkhKVFkzUjdRSjZHNVVZRFA2NE42N0pOVldES1VUUzEzIiwidyI6NTMxLCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo2ODY2NDgzMDIzMTI1MjI0NDUxfQ.png?format=originalOFGHLERTH"

    .line 211
    .line 212
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondVisitor:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 219
    .line 220
    new-instance v1, Ll/pf60;

    .line 221
    .line 222
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6Ikg1TVBLU0tOQUZYNURWVzZRQ1NIM042WkVKNE9aUzEyIiwidyI6NTQwLCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo2OTI4NzY5MTE5MDc5MTkxMDcxfQ.png?format=originalOFGHLERTH"

    .line 223
    .line 224
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6IjNMUDc1RlRJWVQzVEtGM0lJUzNMUkxJNjY3TU9XRDEyIiwidyI6NTQwLCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo2OTMwNzg3ODU2MTc5MTA2MzI3fQ.png?format=originalOFGHLERTH"

    .line 225
    .line 226
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 233
    .line 234
    new-instance v1, Ll/pf60;

    .line 235
    .line 236
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik9SRjJFSkw1QjRUWkIzUEVTNjVWSDNLTUlEVzZKRzEzIiwidyI6NTQ2LCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4NjU0NjI2MzQxNTAzNDYwODc5fQ.png?format=originalOFGHLERTH"

    .line 237
    .line 238
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6IkxQVkNJUlVUUlZOV0VKSVROVEZOQTJNWlhJU0VQMjEzIiwidyI6NTQ2LCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4MDc0MjY0MDA3MjkyODQyNTI3fQ.png?format=originalOFGHLERTH"

    .line 239
    .line 240
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->moment_boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 247
    .line 248
    new-instance v1, Ll/pf60;

    .line 249
    .line 250
    const-string v2, "https://auto.tancdn.com/v1/raw/d33dea27-4357-4a54-a76a-806a175b873513.webp"

    .line 251
    .line 252
    const-string v3, "https://auto.tancdn.com/v1/raw/afab65c0-d236-44c4-9bbd-5479e64838d312.webp"

    .line 253
    .line 254
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->leave_message:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 261
    .line 262
    new-instance v1, Ll/pf60;

    .line 263
    .line 264
    const-string v2, "https://auto.tancdn.com/v1/raw/349da37c-b548-4c22-9359-346b4c39449812.webp"

    .line 265
    .line 266
    const-string v3, "https://auto.tancdn.com/v1/raw/6f04ae5e-e0e8-4c72-9955-e4074543f96913.webp"

    .line 267
    .line 268
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->accelerate_pairing:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 275
    .line 276
    new-instance v1, Ll/pf60;

    .line 277
    .line 278
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IlQ3RFpBRllNVk5JQ1c2SjUzRUxHSkVQSERFSDRVSDEzIiwidyI6NTQwLCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTIxNjY4OTI1MzQ2NjE2ODMyfQ.png"

    .line 279
    .line 280
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6IlhaQ05IUkdFMlVDQTQyWTNLQTNFM1ZCV0wzSEM1TzEzIiwidyI6NTQwLCJoIjo2MTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyODE3MDQyMjkwNTUxNTU3NjMyfQ.png"

    .line 281
    .line 282
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 283
    .line 284
    .line 285
    invoke-virtual {p0, v0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    .line 287
    .line 288
    return-void
.end method
