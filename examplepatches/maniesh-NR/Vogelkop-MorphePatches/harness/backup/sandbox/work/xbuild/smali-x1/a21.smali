.class public La21;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf94;
.implements Lw9l;
.implements Lx9l;


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;

.field public final h:Ljava/lang/Object;

.field public final i:Ljava/lang/Object;

.field public final j:Ljava/lang/Object;

.field public final k:Ljava/lang/Object;

.field public l:Ljava/lang/Object;

.field public m:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltcl;Lrf7;Lcom/opera/android/BrowserActivity;Luk6;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Lhu5;Lx5f;)V
    .registers 13

    .line 197
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 198
    iput-object p1, p0, La21;->a:Ljava/lang/Object;

    .line 199
    iput-object p2, p0, La21;->b:Ljava/lang/Object;

    .line 200
    iput-object p3, p0, La21;->c:Ljava/lang/Object;

    .line 201
    iput-object p4, p0, La21;->d:Ljava/lang/Object;

    .line 202
    iput-object p5, p0, La21;->e:Ljava/lang/Object;

    .line 203
    iput-object p6, p0, La21;->f:Ljava/lang/Object;

    .line 204
    iput-object p7, p0, La21;->g:Ljava/lang/Object;

    .line 205
    iput-object p9, p0, La21;->h:Ljava/lang/Object;

    .line 206
    iput-object p10, p0, La21;->i:Ljava/lang/Object;

    .line 207
    iput-object p11, p0, La21;->m:Ljava/lang/Object;

    .line 208
    iput-object p12, p0, La21;->l:Ljava/lang/Object;

    .line 209
    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    .line 210
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    .line 211
    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object p1

    .line 212
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p2, 0x0

    .line 213
    invoke-static {p8, p2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p3

    .line 214
    invoke-virtual {p1}, Lbf9;->x()Ljavax/crypto/spec/SecretKeySpec;

    move-result-object p1

    const/4 p4, 0x0

    if-nez p1, :cond_36

    move-object p1, p4

    goto :goto_3b

    :cond_36
    const/4 p5, 0x2

    .line 215
    invoke-static {p5, p1, p3, p2}, Lp36;->a(ILjavax/crypto/spec/SecretKeySpec;[BZ)Ljavax/crypto/Cipher;

    move-result-object p1

    .line 216
    :goto_3b
    iput-object p1, p0, La21;->k:Ljava/lang/Object;

    if-nez p1, :cond_4c

    .line 217
    iput-object p4, p0, La21;->j:Ljava/lang/Object;

    .line 218
    new-instance p1, Lbl6;

    const/16 p2, 0x13

    invoke-direct {p1, p0, p2}, Lbl6;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    .line 219
    :cond_4c
    sget-object p1, Lxne;->b:Lii;

    .line 220
    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lt9f;

    new-instance p2, Lfvh;

    invoke-direct {p2}, Lfvh;-><init>()V

    .line 221
    invoke-virtual {p2}, Lfvh;->c()V

    .line 222
    invoke-virtual {p6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Lfvh;->h(Ljava/lang/String;)V

    new-instance p3, Lc74;

    invoke-direct {p3}, Lc74;-><init>()V

    .line 223
    invoke-static {p3}, Lokhttp3/internal/_CacheControlCommonKt;->commonNoCache(Lc74;)Lc74;

    move-result-object p3

    .line 224
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 225
    invoke-static {p3}, Lokhttp3/internal/_CacheControlCommonKt;->commonNoStore(Lc74;)Lc74;

    move-result-object p3

    .line 226
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 227
    invoke-static {p3}, Lokhttp3/internal/_CacheControlCommonKt;->commonBuild(Lc74;)Le74;

    move-result-object p3

    .line 228
    invoke-virtual {p2, p3}, Lfvh;->b(Le74;)V

    .line 229
    new-instance p3, Lkvh;

    invoke-direct {p3, p2}, Lkvh;-><init>(Lfvh;)V

    .line 230
    invoke-virtual {p1, p3}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p1

    iput-object p1, p0, La21;->j:Ljava/lang/Object;

    .line 231
    invoke-interface {p1, p0}, Lv84;->enqueue(Lf94;)V

    return-void
.end method

.method public varargs constructor <init>(Landroid/content/Context;[Lw6j;)V
    .registers 9

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Lcom/opera/android/settings/settings_search/database/SettingsSearchDatabase;

    const-string v2, "settings_search.db"

    invoke-static {v0, v1, v2}, Lxih;->f(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Lu5i;

    move-result-object v0

    invoke-virtual {v0}, Lu5i;->b()Ly5i;

    move-result-object v0

    check-cast v0, Lcom/opera/android/settings/settings_search/database/SettingsSearchDatabase;

    new-instance v1, Li06;

    const/16 v2, 0x1d

    invoke-direct {v1, v2}, Li06;-><init>(B)V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    sget-object v3, Lh9j;->e:Lh9j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, La21;->a:Ljava/lang/Object;

    iput-object v0, p0, La21;->b:Ljava/lang/Object;

    iput-object v1, p0, La21;->c:Ljava/lang/Object;

    iput-object p2, p0, La21;->d:Ljava/lang/Object;

    iput-object v3, p0, La21;->e:Ljava/lang/Object;

    new-instance p2, Lami;

    const/16 v1, 0xb

    invoke-direct {p2, p1, v1}, Lami;-><init>(Landroid/content/Context;B)V

    iput-object p2, p0, La21;->f:Ljava/lang/Object;

    invoke-static {v2}, Landroid/icu/text/Collator;->getInstance(Ljava/util/Locale;)Landroid/icu/text/Collator;

    move-result-object p1

    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroid/icu/text/Collator;->setStrength(I)V

    check-cast p1, Landroid/icu/text/RuleBasedCollator;

    iput-object p1, p0, La21;->g:Ljava/lang/Object;

    new-instance p1, Lh42;

    invoke-direct {p1}, Lh42;-><init>()V

    iget-object p2, p2, Lami;->c:Ljava/lang/Object;

    check-cast p2, Lzyk;

    invoke-virtual {p2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lekc;

    new-instance v4, Ltji;

    const/16 v5, 0xe

    invoke-direct {v4, p0, v5}, Ltji;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Lt7d;

    invoke-direct {v5, v4, v1}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p1, v3, v5}, Lh42;->s(Lekc;Lf7f;)V

    iput-object p1, p0, La21;->h:Ljava/lang/Object;

    new-instance p1, Lkbd;

    invoke-virtual {p2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lekc;

    invoke-virtual {v0}, Lcom/opera/android/settings/settings_search/database/SettingsSearchDatabase;->x()Lpmh;

    move-result-object v0

    iget-object v0, v0, Lpmh;->a:Ly5i;

    iget-object v0, v0, Ly5i;->f:Lpjb;

    if-nez v0, :cond_74

    const/4 v0, 0x0

    :cond_74
    const-string v1, "recent_searches"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lu4h;

    const/16 v4, 0x9

    invoke-direct {v3, v4}, Lu4h;-><init>(B)V

    invoke-virtual {v0, v1, v2, v3}, Lpjb;->a([Ljava/lang/String;ZLkotlin/jvm/functions/Function1;)Lb6i;

    move-result-object v0

    new-instance v1, Lnqi;

    const/4 v3, 0x4

    invoke-direct {v1, p0, v3}, Lnqi;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, p2, v0, v1}, Lkbd;-><init>(Lekc;Lb6i;Lnqi;)V

    iput-object p1, p0, La21;->i:Ljava/lang/Object;

    new-instance p1, Lg9j;

    invoke-direct {p1, p0, v2}, Lg9j;-><init>(La21;B)V

    iput-object p1, p0, La21;->j:Ljava/lang/Object;

    new-instance p1, Lg9j;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lg9j;-><init>(La21;B)V

    iput-object p1, p0, La21;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lda6;Lfa6;Lsrm;)V
    .registers 5

    .line 183
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 184
    iput-object p3, p0, La21;->a:Ljava/lang/Object;

    .line 185
    new-instance p3, Lr72;

    const/4 v0, 0x1

    invoke-direct {p3, p1, p2, p0, v0}, Lr72;-><init>(Lda6;Lfa6;La21;I)V

    invoke-static {p3}, Lie7;->a(Lm7h;)Lm7h;

    move-result-object p3

    iput-object p3, p0, La21;->b:Ljava/lang/Object;

    .line 186
    new-instance p3, Lr72;

    const/4 v0, 0x2

    invoke-direct {p3, p1, p2, p0, v0}, Lr72;-><init>(Lda6;Lfa6;La21;I)V

    invoke-static {p3}, Lie7;->a(Lm7h;)Lm7h;

    move-result-object p3

    iput-object p3, p0, La21;->c:Ljava/lang/Object;

    .line 187
    new-instance p3, Lr72;

    const/4 v0, 0x7

    invoke-direct {p3, p1, p2, p0, v0}, Lr72;-><init>(Lda6;Lfa6;La21;I)V

    invoke-static {p3}, Lie7;->a(Lm7h;)Lm7h;

    move-result-object p3

    iput-object p3, p0, La21;->d:Ljava/lang/Object;

    .line 188
    new-instance p3, Lr72;

    const/16 v0, 0x8

    invoke-direct {p3, p1, p2, p0, v0}, Lr72;-><init>(Lda6;Lfa6;La21;I)V

    invoke-static {p3}, Lie7;->a(Lm7h;)Lm7h;

    move-result-object p3

    iput-object p3, p0, La21;->e:Ljava/lang/Object;

    .line 189
    new-instance p3, Lr72;

    const/4 v0, 0x6

    invoke-direct {p3, p1, p2, p0, v0}, Lr72;-><init>(Lda6;Lfa6;La21;I)V

    invoke-static {p3}, Lie7;->a(Lm7h;)Lm7h;

    move-result-object p3

    iput-object p3, p0, La21;->f:Ljava/lang/Object;

    .line 190
    new-instance p3, Lr72;

    const/16 v0, 0x9

    invoke-direct {p3, p1, p2, p0, v0}, Lr72;-><init>(Lda6;Lfa6;La21;I)V

    invoke-static {p3}, Lie7;->a(Lm7h;)Lm7h;

    move-result-object p3

    iput-object p3, p0, La21;->g:Ljava/lang/Object;

    .line 191
    new-instance p3, Lr72;

    const/4 v0, 0x5

    invoke-direct {p3, p1, p2, p0, v0}, Lr72;-><init>(Lda6;Lfa6;La21;I)V

    invoke-static {p3}, Lie7;->a(Lm7h;)Lm7h;

    move-result-object p3

    iput-object p3, p0, La21;->h:Ljava/lang/Object;

    .line 192
    new-instance p3, Lr72;

    const/16 v0, 0xb

    invoke-direct {p3, p1, p2, p0, v0}, Lr72;-><init>(Lda6;Lfa6;La21;I)V

    invoke-static {p3}, Lie7;->a(Lm7h;)Lm7h;

    move-result-object p3

    iput-object p3, p0, La21;->i:Ljava/lang/Object;

    .line 193
    new-instance p3, Lr72;

    const/16 v0, 0xa

    invoke-direct {p3, p1, p2, p0, v0}, Lr72;-><init>(Lda6;Lfa6;La21;I)V

    invoke-static {p3}, Lie7;->a(Lm7h;)Lm7h;

    move-result-object p3

    iput-object p3, p0, La21;->j:Ljava/lang/Object;

    .line 194
    new-instance p3, Lr72;

    const/4 v0, 0x4

    invoke-direct {p3, p1, p2, p0, v0}, Lr72;-><init>(Lda6;Lfa6;La21;I)V

    invoke-static {p3}, Lie7;->a(Lm7h;)Lm7h;

    move-result-object p3

    iput-object p3, p0, La21;->k:Ljava/lang/Object;

    .line 195
    new-instance p3, Lr72;

    const/4 v0, 0x3

    invoke-direct {p3, p1, p2, p0, v0}, Lr72;-><init>(Lda6;Lfa6;La21;I)V

    invoke-static {p3}, Lie7;->a(Lm7h;)Lm7h;

    move-result-object p3

    iput-object p3, p0, La21;->l:Ljava/lang/Object;

    .line 196
    new-instance p3, Lr72;

    const/4 v0, 0x0

    invoke-direct {p3, p1, p2, p0, v0}, Lr72;-><init>(Lda6;Lfa6;La21;I)V

    invoke-static {p3}, Lie7;->a(Lm7h;)Lm7h;

    move-result-object p1

    iput-object p1, p0, La21;->m:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lqdb;Lkotlin/jvm/functions/Function0;Lz77;Lk6l;Li53;Lnr8;Lu4l;Ls9i;Lysj;Lkotlin/jvm/functions/Function0;Lw9l;)V
    .registers 12

    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 161
    iput-object p1, p0, La21;->a:Ljava/lang/Object;

    .line 162
    iput-object p2, p0, La21;->b:Ljava/lang/Object;

    .line 163
    iput-object p3, p0, La21;->c:Ljava/lang/Object;

    .line 164
    iput-object p4, p0, La21;->d:Ljava/lang/Object;

    .line 165
    iput-object p5, p0, La21;->e:Ljava/lang/Object;

    .line 166
    iput-object p6, p0, La21;->f:Ljava/lang/Object;

    .line 167
    iput-object p7, p0, La21;->g:Ljava/lang/Object;

    .line 168
    iput-object p8, p0, La21;->h:Ljava/lang/Object;

    .line 169
    iput-object p9, p0, La21;->i:Ljava/lang/Object;

    .line 170
    iput-object p10, p0, La21;->j:Ljava/lang/Object;

    .line 171
    iput-object p11, p0, La21;->k:Ljava/lang/Object;

    .line 172
    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 173
    sget-object p2, Lp6l;->a:Lp6l;

    .line 174
    invoke-static {p4, p2}, Lmzg;->i(Lk6l;Lp6l;)Ljava/util/Set;

    move-result-object p2

    .line 175
    check-cast p2, Ljava/util/Collection;

    invoke-interface {p1, p2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 176
    sget-object p2, Lp6l;->b:Lp6l;

    .line 177
    invoke-static {p4, p2}, Lmzg;->i(Lk6l;Lp6l;)Ljava/util/Set;

    move-result-object p2

    .line 178
    check-cast p2, Ljava/util/Collection;

    invoke-interface {p1, p2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 179
    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p1

    .line 180
    new-instance p2, Lpde;

    .line 181
    invoke-direct {p2, p1}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 182
    iput-object p2, p0, La21;->m:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lqej;Lp01;Lkotlin/jvm/functions/Function0;Lj3i;Lkotlin/jvm/functions/Function1;)V
    .registers 6

    .line 232
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 233
    iput-object p2, p0, La21;->a:Ljava/lang/Object;

    .line 234
    iput-object p3, p0, La21;->b:Ljava/lang/Object;

    .line 235
    iput-object p4, p0, La21;->c:Ljava/lang/Object;

    .line 236
    iput-object p5, p0, La21;->d:Ljava/lang/Object;

    .line 237
    new-instance p2, Lpgb;

    invoke-direct {p2}, Lpgb;-><init>()V

    iput-object p2, p0, La21;->e:Ljava/lang/Object;

    .line 238
    new-instance p2, Lz11;

    invoke-direct {p2, p0}, Lz11;-><init>(La21;)V

    iput-object p2, p0, La21;->f:Ljava/lang/Object;

    .line 239
    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    .line 240
    iput-object p1, p0, La21;->g:Ljava/lang/Object;

    .line 241
    new-instance p1, Ls11;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Ls11;-><init>(La21;B)V

    .line 242
    invoke-static {p1}, Lluj;->b(Lkotlin/jvm/functions/Function0;)Li37;

    move-result-object p1

    .line 243
    iput-object p1, p0, La21;->j:Ljava/lang/Object;

    .line 244
    new-instance p1, Ls11;

    const/4 p3, 0x1

    invoke-direct {p1, p0, p3}, Ls11;-><init>(La21;B)V

    .line 245
    invoke-static {p1}, Lluj;->b(Lkotlin/jvm/functions/Function0;)Li37;

    .line 246
    new-instance p1, Lp0g;

    const/high16 p3, 0x7fc00000    # Float.NaN

    .line 247
    invoke-direct {p1, p3}, Lp0g;-><init>(F)V

    .line 248
    iput-object p1, p0, La21;->k:Ljava/lang/Object;

    .line 249
    new-instance p1, Lcf2;

    .line 250
    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 251
    new-instance p1, Lh37;

    invoke-static {}, Lytj;->h()Lttj;

    move-result-object p2

    invoke-virtual {p2}, Lttj;->g()J

    move-result-wide p2

    invoke-direct {p1, p2, p3}, Lh37;-><init>(J)V

    .line 252
    new-instance p1, Lp0g;

    const/4 p2, 0x0

    .line 253
    invoke-direct {p1, p2}, Lp0g;-><init>(F)V

    .line 254
    iput-object p1, p0, La21;->l:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 255
    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    .line 256
    iput-object p1, p0, La21;->h:Ljava/lang/Object;

    .line 257
    new-instance p1, Lx9d;

    .line 258
    sget-object p2, Ln08;->a:Ln08;

    .line 259
    invoke-direct {p1, p2}, Lx9d;-><init>(Ljava/util/Map;)V

    .line 260
    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    .line 261
    iput-object p1, p0, La21;->i:Ljava/lang/Object;

    .line 262
    new-instance p1, Lw11;

    invoke-direct {p1, p0}, Lw11;-><init>(La21;)V

    iput-object p1, p0, La21;->m:Ljava/lang/Object;

    return-void
.end method

.method public static g(Lv6j;)Ljava/util/List;
    .registers 3

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lv6j;->d()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_10
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_26

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lex4;

    invoke-static {v1}, La21;->g(Lv6j;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_10

    :cond_26
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static s(La21;Ljava/util/List;Ljava/lang/String;I)V
    .registers 10

    and-int/lit8 v0, p3, 0x1

    if-eqz v0, :cond_18

    iget-object p1, p0, La21;->f:Ljava/lang/Object;

    check-cast p1, Lami;

    iget-object p1, p1, Lami;->c:Ljava/lang/Object;

    check-cast p1, Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lekc;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    :cond_18
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_2a

    iget-object p2, p0, La21;->m:Ljava/lang/Object;

    check-cast p2, Ljava/lang/String;

    if-nez p2, :cond_2a

    iget-object p2, p0, La21;->e:Ljava/lang/Object;

    check-cast p2, Lshf;

    iget-object p2, p2, Lshf;->a:Ljava/lang/Object;

    check-cast p2, Ljava/lang/String;

    :cond_2a
    const/4 p3, 0x0

    if-eqz p2, :cond_39

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p2}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_3a

    :cond_39
    move-object p2, p3

    :goto_3a
    iput-object p2, p0, La21;->m:Ljava/lang/Object;

    if-nez p1, :cond_3f

    return-void

    :cond_3f
    if-nez p2, :cond_43

    const-string p2, ""

    :cond_43
    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_4e
    :goto_4e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Ll6j;

    iget-object v2, v2, Ll6j;->h:Lehc;

    if-eqz v2, :cond_65

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4e

    :cond_65
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_69
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    new-instance v4, Landroid/icu/text/StringSearch;

    new-instance v5, Ljava/text/StringCharacterIterator;

    invoke-direct {v5, v3}, Ljava/text/StringCharacterIterator;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, La21;->g:Ljava/lang/Object;

    check-cast v3, Landroid/icu/text/RuleBasedCollator;

    invoke-direct {v4, p2, v5, v3}, Landroid/icu/text/StringSearch;-><init>(Ljava/lang/String;Ljava/text/CharacterIterator;Landroid/icu/text/RuleBasedCollator;)V

    invoke-virtual {v4}, Landroid/icu/text/SearchIterator;->next()I

    move-result v3

    if-ltz v3, :cond_69

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4e

    :cond_8d
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    iget-object p2, p0, La21;->e:Ljava/lang/Object;

    check-cast p2, Lshf;

    iget-object v0, p0, La21;->m:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    move-object v1, p1

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_a3

    move-object p3, v0

    :cond_a3
    invoke-virtual {p2, p3}, Lshf;->S(Ljava/lang/Object;)V

    iget-object p0, p0, La21;->h:Ljava/lang/Object;

    check-cast p0, Lh42;

    invoke-virtual {p0, p1}, Lekc;->n(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final C()Likc;
    .registers 1

    iget-object p0, p0, La21;->m:Ljava/lang/Object;

    check-cast p0, Lpde;

    return-object p0
.end method

.method public D(I)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public E(I)Lb2l;
    .registers 10

    iget-object v0, p0, La21;->d:Ljava/lang/Object;

    check-cast v0, Lk6l;

    sget-object v1, Lu3l;->a:Ls3l;

    new-instance v1, Lr3l;

    invoke-direct {v1, p1}, Lr3l;-><init>(I)V

    sget-object v2, Ly6l;->a:Ly6l;

    invoke-static {v0, v1, v2}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_22

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2l;

    invoke-interface {v0}, Lb9l;->T()Lp6l;

    move-result-object v0

    goto :goto_24

    :cond_22
    sget-object v0, Lp6l;->a:Lp6l;

    :goto_24
    iget-object v1, p0, La21;->a:Ljava/lang/Object;

    check-cast v1, Lqdb;

    sget-object v2, Lvr0;->i:Lvr0;

    invoke-interface {v1, v2}, Lqdb;->b(Lvr0;)V

    iget-object p0, p0, La21;->k:Ljava/lang/Object;

    check-cast p0, Lw9l;

    new-instance v1, Lcom/opera/android/browser/TabInfo;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    const/4 v2, 0x0

    move v3, p1

    invoke-direct/range {v1 .. v7}, Lcom/opera/android/browser/TabInfo;-><init>(IIJJ)V

    invoke-interface {p0, v0, v1}, Lw9l;->j0(Lp6l;Lcom/opera/android/browser/TabInfo;)Lb2l;

    move-result-object p0

    return-object p0
.end method

.method public final L(Ljava/lang/Long;)V
    .registers 2

    iget-object p0, p0, La21;->k:Ljava/lang/Object;

    check-cast p0, Lw9l;

    invoke-interface {p0, p1}, Lw9l;->L(Ljava/lang/Long;)V

    return-void
.end method

.method public final N(Lz3;)V
    .registers 8

    iget-object v0, p0, La21;->a:Ljava/lang/Object;

    check-cast v0, Lqdb;

    sget-object v1, Lvr0;->l:Lvr0;

    invoke-interface {v0, v1}, Lqdb;->b(Lvr0;)V

    iget-object v0, p0, La21;->d:Ljava/lang/Object;

    check-cast v0, Lk6l;

    iget-object v0, v0, Lk6l;->a:Lxbf;

    iget-object v0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Lvzk;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lvzk;->L(Z)I

    move-result v0

    iget-object v1, p0, La21;->c:Ljava/lang/Object;

    check-cast v1, Lz77;

    new-instance v2, Ldw7;

    iget-object v3, p0, La21;->b:Ljava/lang/Object;

    check-cast v3, Lkotlin/jvm/functions/Function0;

    invoke-interface {v3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/Context;

    iget-object p0, p0, La21;->g:Ljava/lang/Object;

    check-cast p0, Lu4l;

    new-instance v4, Lug5;

    const/4 v5, 0x4

    invoke-direct {v4, p1, v0, v5}, Lug5;-><init>(Ljava/lang/Object;IB)V

    invoke-direct {v2, v3, p0, v0, v4}, Ldw7;-><init>(Landroid/content/Context;Lu4l;ILkotlin/jvm/functions/Function0;)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v1, v2, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final O(Ljava/lang/Iterable;ZZ)V
    .registers 7

    iget-object v0, p0, La21;->a:Ljava/lang/Object;

    check-cast v0, Lqdb;

    if-eqz p2, :cond_9

    sget-object v1, Lvr0;->s:Lvr0;

    goto :goto_b

    :cond_9
    sget-object v1, Lvr0;->u:Lvr0;

    :goto_b
    invoke-interface {v0, v1}, Lqdb;->b(Lvr0;)V

    new-instance v0, Lt6l;

    iget-object v1, p0, La21;->d:Ljava/lang/Object;

    check-cast v1, Lk6l;

    const/4 v2, 0x1

    invoke-direct {v0, v1, p2, p1, v2}, Lt6l;-><init>(Lk6l;ZLjava/lang/Iterable;B)V

    if-eqz p3, :cond_1d

    invoke-virtual {p0, v0}, La21;->q(Lr6l;)V

    :cond_1d
    return-void
.end method

.method public final P(Ljava/lang/Integer;Ljava/util/Set;Lvr0;)V
    .registers 16

    iget-object v0, p0, La21;->a:Ljava/lang/Object;

    check-cast v0, Lqdb;

    invoke-interface {v0, p3}, Lqdb;->b(Lvr0;)V

    invoke-interface {p2}, Ljava/util/Set;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_e

    return-void

    :cond_e
    iget-object p3, p0, La21;->d:Ljava/lang/Object;

    move-object v1, p3

    check-cast v1, Lk6l;

    iget-object p3, p0, La21;->g:Ljava/lang/Object;

    check-cast p3, Lu4l;

    const/4 v0, 0x0

    if-eqz p1, :cond_1f

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_29

    :cond_1f
    iget-object v2, v1, Lk6l;->a:Lxbf;

    iget-object v2, v2, Lxbf;->b:Ljava/lang/Object;

    check-cast v2, Lvzk;

    invoke-virtual {v2, v0}, Lvzk;->L(Z)I

    move-result v2

    :goto_29
    invoke-virtual {p3, v2}, Lu4l;->a(I)Lm4l;

    move-result-object v2

    if-nez p1, :cond_30

    const/4 v0, 0x1

    :cond_30
    move v3, v0

    iget-object p1, v1, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v4

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    move-object p1, p2

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_49
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_69

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lb2l;

    new-instance v0, Ls6l;

    move-object v6, p3

    check-cast v6, Ld7l;

    iget-object v6, v6, Ld7l;->j:Le7l;

    invoke-interface {v6}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v6

    iget v6, v6, Lcom/opera/android/browser/TabInfo;->d:I

    invoke-direct {v0, p3, v6}, Ls6l;-><init>(Lb2l;I)V

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_49

    :cond_69
    sget-object p1, Lh6l;->d:Lh6l;

    invoke-virtual {v1, p1}, Lk6l;->h(Lh6l;)V

    :try_start_6e
    check-cast p2, Ljava/lang/Iterable;

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_74
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_99

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lb2l;

    move-object v0, p3

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v6

    iget v10, v2, Lm4l;->a:I

    const/4 v11, 0x7

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    invoke-static/range {v6 .. v11}, Lcom/opera/android/browser/TabInfo;->a(Lcom/opera/android/browser/TabInfo;JIII)Lcom/opera/android/browser/TabInfo;

    move-result-object v0

    check-cast p3, Ld7l;

    invoke-virtual {p3, v0}, Ld7l;->s(Lcom/opera/android/browser/TabInfo;)Z
    :try_end_98
    .catchall {:try_start_6e .. :try_end_98} :catchall_aa

    goto :goto_74

    :cond_99
    invoke-virtual {v1, p1}, Lk6l;->n(Lh6l;)V

    invoke-static {v1}, Lexg;->d(Lk6l;)V

    new-instance v0, Ls14;

    const/16 v6, 0x15

    invoke-direct/range {v0 .. v6}, Ls14;-><init>(Ljava/lang/Object;Ljava/lang/Object;ZLjava/util/List;Ljava/util/List;B)V

    invoke-virtual {p0, v0}, La21;->q(Lr6l;)V

    return-void

    :catchall_aa
    move-exception v0

    move-object p0, v0

    invoke-virtual {v1, p1}, Lk6l;->n(Lh6l;)V

    throw p0
.end method

.method public X(Ljava/util/List;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final a(Lgfe;Lx11;Lnt5;)Ljava/lang/Object;
    .registers 18

    move-object/from16 v0, p3

    iget-object v1, p0, La21;->d:Ljava/lang/Object;

    check-cast v1, Lkotlin/jvm/functions/Function1;

    iget-object v2, p0, La21;->k:Ljava/lang/Object;

    check-cast v2, Lp0g;

    instance-of v3, v0, Lt11;

    if-eqz v3, :cond_1d

    move-object v3, v0

    check-cast v3, Lt11;

    iget v4, v3, Lt11;->v:I

    const/high16 v5, -0x80000000

    and-int v6, v4, v5

    if-eqz v6, :cond_1d

    sub-int/2addr v4, v5

    iput v4, v3, Lt11;->v:I

    goto :goto_22

    :cond_1d
    new-instance v3, Lt11;

    invoke-direct {v3, p0, v0}, Lt11;-><init>(La21;Lnt5;)V

    :goto_22
    iget-object v0, v3, Lt11;->t:Ljava/lang/Object;

    sget-object v4, Lpx5;->a:Lpx5;

    iget v5, v3, Lt11;->v:I

    const/high16 v6, 0x3f000000    # 0.5f

    const/4 v7, 0x1

    if-eqz v5, :cond_3a

    if-ne v5, v7, :cond_33

    :try_start_2f
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_32
    .catchall {:try_start_2f .. :try_end_32} :catchall_93

    goto :goto_5e

    :cond_33
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_3a
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_3d
    iget-object v0, p0, La21;->e:Ljava/lang/Object;

    move-object v10, v0

    check-cast v10, Lpgb;

    new-instance v11, Lu11;

    const/4 v0, 0x0

    const/4 v12, 0x0

    move-object/from16 v5, p2

    invoke-direct {v11, p0, v5, v12, v0}, Lu11;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput v7, v3, Lt11;->v:I

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v8, Logb;

    const/4 v13, 0x0

    move-object v9, p1

    invoke-direct/range {v8 .. v13}, Logb;-><init>(Lgfe;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Lmt5;B)V

    invoke-static {v8, v3}, Lsgb;->q(Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p1
    :try_end_5b
    .catchall {:try_start_3d .. :try_end_5b} :catchall_93

    if-ne p1, v4, :cond_5e

    return-object v4

    :cond_5e
    :goto_5e
    invoke-virtual {p0}, La21;->h()Lx9d;

    move-result-object p1

    invoke-virtual {v2}, Lp0g;->h()F

    move-result v0

    invoke-virtual {p1, v0}, Lx9d;->a(F)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_90

    invoke-virtual {v2}, Lp0g;->h()F

    move-result v0

    invoke-virtual {p0}, La21;->h()Lx9d;

    move-result-object v2

    invoke-virtual {v2, p1}, Lx9d;->d(Ljava/lang/Object;)F

    move-result v2

    sub-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, v6

    if-gtz v0, :cond_90

    invoke-interface {v1, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_90

    invoke-virtual {p0, p1}, La21;->n(Ljava/lang/Object;)V

    :cond_90
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :catchall_93
    move-exception v0

    move-object p1, v0

    invoke-virtual {p0}, La21;->h()Lx9d;

    move-result-object v0

    invoke-virtual {v2}, Lp0g;->h()F

    move-result v3

    invoke-virtual {v0, v3}, Lx9d;->a(F)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_c7

    invoke-virtual {v2}, Lp0g;->h()F

    move-result v2

    invoke-virtual {p0}, La21;->h()Lx9d;

    move-result-object v3

    invoke-virtual {v3, v0}, Lx9d;->d(Ljava/lang/Object;)F

    move-result v3

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpg-float v2, v2, v6

    if-gtz v2, :cond_c7

    invoke-interface {v1, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_c7

    invoke-virtual {p0, v0}, La21;->n(Ljava/lang/Object;)V

    :cond_c7
    throw p1
.end method

.method public final b(Ljava/lang/Object;Lgfe;Ldr9;Lnt5;)Ljava/lang/Object;
    .registers 23

    move-object/from16 v1, p0

    move-object/from16 v0, p4

    iget-object v2, v1, La21;->d:Ljava/lang/Object;

    move-object v6, v2

    check-cast v6, Lkotlin/jvm/functions/Function1;

    iget-object v2, v1, La21;->k:Ljava/lang/Object;

    move-object v7, v2

    check-cast v7, Lp0g;

    instance-of v2, v0, Lv11;

    if-eqz v2, :cond_22

    move-object v2, v0

    check-cast v2, Lv11;

    iget v3, v2, Lv11;->v:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_22

    sub-int/2addr v3, v4

    iput v3, v2, Lv11;->v:I

    :goto_20
    move-object v8, v2

    goto :goto_28

    :cond_22
    new-instance v2, Lv11;

    invoke-direct {v2, v1, v0}, Lv11;-><init>(La21;Lnt5;)V

    goto :goto_20

    :goto_28
    iget-object v0, v8, Lv11;->t:Ljava/lang/Object;

    sget-object v9, Lpx5;->a:Lpx5;

    iget v2, v8, Lv11;->v:I

    const/high16 v10, 0x3f000000    # 0.5f

    const/4 v11, 0x1

    const/16 v16, 0x0

    if-eqz v2, :cond_44

    if-ne v2, v11, :cond_3d

    :try_start_37
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_3a
    .catchall {:try_start_37 .. :try_end_3a} :catchall_b4

    move-object/from16 v4, v16

    goto :goto_7c

    :cond_3d
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0

    :cond_44
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {v1}, La21;->h()Lx9d;

    move-result-object v0

    iget-object v0, v0, Lx9d;->a:Ljava/util/Map;

    move-object/from16 v2, p1

    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_ed

    :try_start_55
    iget-object v0, v1, La21;->e:Ljava/lang/Object;

    move-object v14, v0

    check-cast v14, Lpgb;

    new-instance v15, Lk50;
    :try_end_5c
    .catchall {:try_start_55 .. :try_end_5c} :catchall_b4

    const/4 v5, 0x1

    move-object/from16 v3, p3

    move-object v0, v15

    move-object/from16 v4, v16

    :try_start_62
    invoke-direct/range {v0 .. v5}, Lk50;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V
    :try_end_65
    .catchall {:try_start_62 .. :try_end_65} :catchall_b2

    :try_start_65
    iput v11, v8, Lv11;->v:I

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v12, Logb;

    const/16 v17, 0x0

    move-object/from16 v13, p2

    invoke-direct/range {v12 .. v17}, Logb;-><init>(Lgfe;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Lmt5;B)V
    :try_end_73
    .catchall {:try_start_65 .. :try_end_73} :catchall_b4

    move-object/from16 v4, v16

    :try_start_75
    invoke-static {v12, v8}, Lsgb;->q(Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v0
    :try_end_79
    .catchall {:try_start_75 .. :try_end_79} :catchall_b2

    if-ne v0, v9, :cond_7c

    return-object v9

    :cond_7c
    :goto_7c
    invoke-virtual {v1, v4}, La21;->p(Ljava/lang/Object;)V

    invoke-virtual {v1}, La21;->h()Lx9d;

    move-result-object v0

    invoke-virtual {v7}, Lp0g;->h()F

    move-result v2

    invoke-virtual {v0, v2}, Lx9d;->a(F)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_f0

    invoke-virtual {v7}, Lp0g;->h()F

    move-result v2

    invoke-virtual {v1}, La21;->h()Lx9d;

    move-result-object v3

    invoke-virtual {v3, v0}, Lx9d;->d(Ljava/lang/Object;)F

    move-result v3

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpg-float v2, v2, v10

    if-gtz v2, :cond_f0

    invoke-interface {v6, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_f0

    invoke-virtual {v1, v0}, La21;->n(Ljava/lang/Object;)V

    goto :goto_f0

    :catchall_b2
    move-exception v0

    goto :goto_b7

    :catchall_b4
    move-exception v0

    move-object/from16 v4, v16

    :goto_b7
    invoke-virtual {v1, v4}, La21;->p(Ljava/lang/Object;)V

    invoke-virtual {v1}, La21;->h()Lx9d;

    move-result-object v2

    invoke-virtual {v7}, Lp0g;->h()F

    move-result v3

    invoke-virtual {v2, v3}, Lx9d;->a(F)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_ec

    invoke-virtual {v7}, Lp0g;->h()F

    move-result v3

    invoke-virtual {v1}, La21;->h()Lx9d;

    move-result-object v4

    invoke-virtual {v4, v2}, Lx9d;->d(Ljava/lang/Object;)F

    move-result v4

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpg-float v3, v3, v10

    if-gtz v3, :cond_ec

    invoke-interface {v6, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_ec

    invoke-virtual {v1, v2}, La21;->n(Ljava/lang/Object;)V

    :cond_ec
    throw v0

    :cond_ed
    invoke-virtual/range {p0 .. p1}, La21;->n(Ljava/lang/Object;)V

    :cond_f0
    :goto_f0
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0
.end method

.method public final c(FFLjava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-object v0, p0, La21;->a:Ljava/lang/Object;

    check-cast v0, Lp01;

    invoke-virtual {p0}, La21;->h()Lx9d;

    move-result-object v1

    invoke-virtual {v1, p3}, Lx9d;->d(Ljava/lang/Object;)F

    move-result v2

    iget-object p0, p0, La21;->b:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    move-result p0

    cmpg-float v3, v2, p1

    if-eqz v3, :cond_9b

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v4

    if-nez v4, :cond_9b

    if-gez v3, :cond_59

    cmpl-float p0, p2, p0

    const/4 p2, 0x1

    if-ltz p0, :cond_30

    invoke-virtual {v1, p1, p2}, Lx9d;->b(FZ)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_30
    invoke-virtual {v1, p1, p2}, Lx9d;->b(FZ)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v1, p0}, Lx9d;->d(Ljava/lang/Object;)F

    move-result p2

    sub-float/2addr p2, v2

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    invoke-virtual {v0, p2}, Lp01;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->floatValue()F

    move-result p2

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    add-float/2addr p2, v2

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    cmpg-float p1, p1, p2

    if-ltz p1, :cond_9b

    return-object p0

    :cond_59
    neg-float p0, p0

    cmpg-float p0, p2, p0

    const/4 p2, 0x0

    if-gtz p0, :cond_64

    invoke-virtual {v1, p1, p2}, Lx9d;->b(FZ)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_64
    invoke-virtual {v1, p1, p2}, Lx9d;->b(FZ)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v1, p0}, Lx9d;->d(Ljava/lang/Object;)F

    move-result p2

    sub-float p2, v2, p2

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    invoke-virtual {v0, p2}, Lp01;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->floatValue()F

    move-result p2

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    sub-float/2addr v2, p2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_97

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    cmpg-float p1, p1, p2

    if-gez p1, :cond_9c

    goto :goto_9b

    :cond_97
    cmpl-float p1, p1, p2

    if-lez p1, :cond_9c

    :cond_9b
    :goto_9b
    return-object p3

    :cond_9c
    return-object p0
.end method

.method public final d(Lvzh;Ljava/io/FileOutputStream;)Landroid/util/Pair;
    .registers 15

    iget-object p0, p0, La21;->k:Ljava/lang/Object;

    check-cast p0, Ljavax/crypto/Cipher;

    const/4 v0, 0x0

    if-nez p0, :cond_8

    return-object v0

    :cond_8
    invoke-virtual {p1}, Lvzh;->byteStream()Ljava/io/InputStream;

    move-result-object p1

    const/high16 v1, 0x10000

    new-array v2, v1, [B

    new-array v1, v1, [B

    const-wide/16 v3, 0x0

    :try_start_14
    const-string v5, "SHA-256"

    invoke-static {v5}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v5
    :try_end_1a
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_14 .. :try_end_1a} :catch_1b

    goto :goto_1c

    :catch_1b
    move-object v5, v0

    :cond_1c
    :goto_1c
    invoke-virtual {p1, v2}, Ljava/io/InputStream;->read([B)I

    move-result v6

    :goto_20
    const/4 v7, -0x1

    const/4 v8, 0x0

    if-ne v6, v7, :cond_32

    :try_start_24
    invoke-virtual {p0, v8}, Ljavax/crypto/Cipher;->getOutputSize(I)I

    move-result v9

    array-length v10, v1

    if-le v9, v10, :cond_2d

    new-array v1, v9, [B

    :cond_2d
    invoke-virtual {p0, v1, v8}, Ljavax/crypto/Cipher;->doFinal([BI)I

    move-result v9

    goto :goto_36

    :cond_32
    invoke-virtual {p0, v2, v8, v6, v1}, Ljavax/crypto/Cipher;->update([BII[B)I

    move-result v9
    :try_end_36
    .catch Ljavax/crypto/ShortBufferException; {:try_start_24 .. :try_end_36} :catch_55

    :goto_36
    int-to-long v10, v9

    add-long/2addr v3, v10

    if-eqz v5, :cond_3d

    invoke-virtual {v5, v1, v8, v9}, Ljava/security/MessageDigest;->update([BII)V

    :cond_3d
    invoke-virtual {p2, v1, v8, v9}, Ljava/io/OutputStream;->write([BII)V

    if-ne v6, v7, :cond_1c

    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    new-instance p0, Landroid/util/Pair;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    if-eqz v5, :cond_51

    invoke-virtual {v5}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    :cond_51
    invoke-direct {p0, p1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p0

    :catch_55
    if-eq v6, v7, :cond_58

    move v8, v6

    :cond_58
    invoke-virtual {p0, v8}, Ljavax/crypto/Cipher;->getOutputSize(I)I

    move-result v1

    new-array v1, v1, [B

    goto :goto_20
.end method

.method public final d0(Lb2l;)V
    .registers 4

    iget-object v0, p0, La21;->a:Ljava/lang/Object;

    check-cast v0, Lqdb;

    sget-object v1, Lvr0;->m:Lvr0;

    invoke-interface {v0, v1}, Lqdb;->b(Lvr0;)V

    iget-object p0, p0, La21;->d:Ljava/lang/Object;

    check-cast p0, Lk6l;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lk6l;->i(Lb2l;Z)Ld7l;

    return-void
.end method

.method public final e(I)V
    .registers 3

    iget-object p0, p0, La21;->m:Ljava/lang/Object;

    check-cast p0, Lpde;

    if-eqz p1, :cond_1d

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->m0(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1d

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_1d
    return-void
.end method

.method public final f()V
    .registers 5

    iget-object v0, p0, La21;->j:Ljava/lang/Object;

    check-cast v0, Lokhttp3/internal/connection/RealCall;

    if-eqz v0, :cond_9

    invoke-interface {v0}, Lv84;->cancel()V

    :cond_9
    iget-object v0, p0, La21;->h:Ljava/lang/Object;

    check-cast v0, Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    const-string v2, "file"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_28

    new-instance v1, Ljava/io/File;

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v0, Lbkh;

    invoke-direct {v0, v1}, Lbkh;-><init>(Ljava/io/File;)V

    goto :goto_30

    :cond_28
    iget-object v1, p0, La21;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    invoke-static {v1, v0}, Ldd7;->e(Landroid/content/Context;Landroid/net/Uri;)Lrlj;

    move-result-object v0

    :goto_30
    invoke-virtual {v0}, Ldd7;->c()Z

    iget-object v0, p0, La21;->e:Ljava/lang/Object;

    check-cast v0, Luk6;

    new-instance v1, Lglj;

    const v2, 0x7f1405e1

    const/16 v3, 0x9c4

    invoke-direct {v1, v2, v3}, Lglj;-><init>(II)V

    invoke-virtual {v0, v1}, Luk6;->f(Lo93;)V

    iget-object v0, p0, La21;->m:Ljava/lang/Object;

    check-cast v0, Lhu5;

    if-nez v0, :cond_4b

    return-void

    :cond_4b
    const/4 v1, 0x0

    iput-object v1, p0, La21;->m:Ljava/lang/Object;

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Lhu5;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final g0(Ljava/util/Set;Lpdb;Lvr0;Z)V
    .registers 11

    iget-object v0, p0, La21;->a:Ljava/lang/Object;

    check-cast v0, Lqdb;

    if-eqz p4, :cond_46

    iget-object p4, p0, La21;->b:Ljava/lang/Object;

    check-cast p4, Lkotlin/jvm/functions/Function0;

    invoke-interface {p4}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p4

    move-object v1, p4

    check-cast v1, Landroid/content/Context;

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result p4

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    new-instance v3, Ltxh;

    const v2, 0x7f12004b

    invoke-direct {v3, v0, v2, p4}, Ltxh;-><init>([Ljava/lang/Object;II)V

    new-instance v5, Ly9l;

    invoke-direct {v5, p0, p1, p2, p3}, Ly9l;-><init>(La21;Ljava/util/Set;Lpdb;Lvr0;)V

    new-instance v0, Lg25;

    const v2, 0x7f14044c

    const v4, 0x7f140450

    invoke-direct/range {v0 .. v5}, Lg25;-><init>(Landroid/content/Context;ILpxh;ILandroid/content/DialogInterface$OnClickListener;)V

    invoke-static {v1}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, p1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_46
    invoke-interface {v0, p3}, Lqdb;->b(Lvr0;)V

    invoke-interface {v0, p2}, Lqdb;->a(Lpdb;)V

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_53

    return-void

    :cond_53
    new-instance p2, Lshf;

    iget-object p3, p0, La21;->d:Ljava/lang/Object;

    check-cast p3, Lk6l;

    iget-object p4, p0, La21;->j:Ljava/lang/Object;

    check-cast p4, Lkotlin/jvm/functions/Function0;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p3, p2, Lshf;->a:Ljava/lang/Object;

    iput-object p4, p2, Lshf;->b:Ljava/lang/Object;

    new-instance p4, Ljava/util/ArrayList;

    invoke-direct {p4}, Ljava/util/ArrayList;-><init>()V

    iput-object p4, p2, Lshf;->c:Ljava/lang/Object;

    iget-object p3, p3, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {p3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p3

    move-object p4, p1

    check-cast p4, Ljava/lang/Iterable;

    invoke-interface {p4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p4

    :cond_78
    :goto_78
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_cb

    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2l;

    invoke-interface {p3, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_78

    iget-object v2, p2, Lshf;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    move-object v3, v0

    check-cast v3, Ld7l;

    iget-object v3, v3, Ld7l;->j:Le7l;

    invoke-interface {v3}, Lb9l;->m()Z

    move-result v3

    if-eqz v3, :cond_ae

    new-instance v3, Lu6l;

    check-cast v0, Ld7l;

    iget-object v4, v0, Ld7l;->j:Le7l;

    invoke-interface {v4}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v4

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v0

    invoke-direct {v3, v1, v4, v0}, Lu6l;-><init>(ILjava/lang/String;Lcom/opera/android/browser/TabInfo;)V

    goto :goto_c7

    :cond_ae
    new-instance v3, Lv6l;

    check-cast v0, Ld7l;

    iget-object v4, v0, Ld7l;->j:Le7l;

    invoke-interface {v4}, Lb9l;->getId()I

    move-result v4

    iget-object v5, v0, Ld7l;->j:Le7l;

    invoke-interface {v5}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v5

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v0

    invoke-direct {v3, v1, v4, v5, v0}, Lv6l;-><init>(IILjava/lang/String;Lcom/opera/android/browser/TabInfo;)V

    :goto_c7
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_78

    :cond_cb
    iget-object p3, p2, Lshf;->c:Ljava/lang/Object;

    check-cast p3, Ljava/util/ArrayList;

    new-instance p4, Lvoj;

    const/16 v0, 0x14

    invoke-direct {p4, v0}, Lvoj;-><init>(B)V

    new-instance v0, Lvd3;

    const/4 v1, 0x5

    invoke-direct {v0, p4, v1}, Lvd3;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, p3}, Ln95;->r(Ljava/util/Comparator;Ljava/util/List;)V

    iget-object p3, p2, Lshf;->a:Ljava/lang/Object;

    check-cast p3, Lk6l;

    invoke-virtual {p3, p1}, Lk6l;->l(Ljava/util/Set;)V

    invoke-virtual {p0, p2}, La21;->q(Lr6l;)V

    return-void
.end method

.method public final h()Lx9d;
    .registers 1

    iget-object p0, p0, La21;->i:Ljava/lang/Object;

    check-cast p0, Lt0g;

    invoke-virtual {p0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lx9d;

    return-object p0
.end method

.method public final h0(Lb2l;Lcom/opera/android/browser/TabInfo;)Lb2l;
    .registers 5

    iget-object v0, p0, La21;->a:Ljava/lang/Object;

    check-cast v0, Lqdb;

    sget-object v1, Lvr0;->b:Lvr0;

    invoke-interface {v0, v1}, Lqdb;->b(Lvr0;)V

    iget-object p0, p0, La21;->k:Ljava/lang/Object;

    check-cast p0, Lw9l;

    invoke-interface {p0, p1, p2}, Lw9l;->h0(Lb2l;Lcom/opera/android/browser/TabInfo;)Lb2l;

    move-result-object p0

    return-object p0
.end method

.method public final i(F)F
    .registers 5

    iget-object v0, p0, La21;->k:Ljava/lang/Object;

    check-cast v0, Lp0g;

    invoke-virtual {v0}, Lp0g;->h()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_10

    const/4 v0, 0x0

    goto :goto_14

    :cond_10
    invoke-virtual {v0}, Lp0g;->h()F

    move-result v0

    :goto_14
    add-float/2addr v0, p1

    invoke-virtual {p0}, La21;->h()Lx9d;

    move-result-object p1

    invoke-virtual {p1}, Lx9d;->c()F

    move-result p1

    invoke-virtual {p0}, La21;->h()Lx9d;

    move-result-object p0

    iget-object p0, p0, Lx9d;->a:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_35

    const/4 p0, 0x0

    goto :goto_58

    :cond_35
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    :goto_3f
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_54

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    goto :goto_3f

    :cond_54
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    :goto_58
    if-eqz p0, :cond_5f

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    goto :goto_61

    :cond_5f
    const/high16 p0, 0x7fc00000    # Float.NaN

    :goto_61
    invoke-static {v0, p1, p0}, Ldjh;->b(FFF)F

    move-result p0

    return p0
.end method

.method public final j()V
    .registers 7

    iget-object v0, p0, La21;->l:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_2a

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_b
    if-ge v2, v1, :cond_2a

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lv6j;

    iget-object v4, v3, Lv6j;->b:Lhx5;

    iget-object v5, p0, La21;->j:Ljava/lang/Object;

    check-cast v5, Lg9j;

    invoke-virtual {v4, v5}, Lekc;->p(Lf7f;)V

    invoke-virtual {v3}, Lv6j;->c()Lhx5;

    move-result-object v3

    iget-object v4, p0, La21;->k:Ljava/lang/Object;

    check-cast v4, Lg9j;

    invoke-virtual {v3, v4}, Lekc;->p(Lf7f;)V

    goto :goto_b

    :cond_2a
    const/4 v0, 0x0

    iput-object v0, p0, La21;->l:Ljava/lang/Object;

    return-void
.end method

.method public final j0(Lp6l;Lcom/opera/android/browser/TabInfo;)Lb2l;
    .registers 6

    iget-object v0, p0, La21;->a:Ljava/lang/Object;

    check-cast v0, Lqdb;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_15

    const/4 v2, 0x1

    if-ne v1, v2, :cond_10

    sget-object v1, Lvr0;->c:Lvr0;

    goto :goto_17

    :cond_10
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_15
    sget-object v1, Lvr0;->b:Lvr0;

    :goto_17
    invoke-interface {v0, v1}, Lqdb;->b(Lvr0;)V

    iget-object p0, p0, La21;->k:Ljava/lang/Object;

    check-cast p0, Lw9l;

    invoke-interface {p0, p1, p2}, Lw9l;->j0(Lp6l;Lcom/opera/android/browser/TabInfo;)Lb2l;

    move-result-object p0

    return-object p0
.end method

.method public final k(Lp6l;)Lb2l;
    .registers 4

    iget-object v0, p0, La21;->a:Ljava/lang/Object;

    check-cast v0, Lqdb;

    sget-object v1, Lvr0;->b:Lvr0;

    invoke-interface {v0, v1}, Lqdb;->b(Lvr0;)V

    iget-object p0, p0, La21;->k:Ljava/lang/Object;

    check-cast p0, Lw9l;

    invoke-interface {p0, p1}, Lw9l;->k(Lp6l;)Lb2l;

    move-result-object p0

    return-object p0
.end method

.method public k0()V
    .registers 1

    return-void
.end method

.method public final l()F
    .registers 2

    iget-object p0, p0, La21;->k:Ljava/lang/Object;

    check-cast p0, Lp0g;

    invoke-virtual {p0}, Lp0g;->h()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_13

    invoke-virtual {p0}, Lp0g;->h()F

    move-result p0

    return p0

    :cond_13
    const-string p0, "The offset was read before being initialized. Did you access the offset in a phase before layout, like effects or composition?"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public m(Lb2l;)V
    .registers 3

    iget-object p0, p0, La21;->d:Ljava/lang/Object;

    check-cast p0, Lk6l;

    const/4 v0, 0x3

    invoke-virtual {p0, p1, v0}, Lk6l;->C(Lb2l;I)V

    return-void
.end method

.method public final m0(Ljava/util/LinkedHashSet;)V
    .registers 7

    iget-object v0, p0, La21;->a:Ljava/lang/Object;

    check-cast v0, Lqdb;

    sget-object v1, Lvr0;->A:Lvr0;

    invoke-interface {v0, v1}, Lqdb;->b(Lvr0;)V

    new-instance v0, Lwjj;

    iget-object v1, p0, La21;->b:Ljava/lang/Object;

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    iget-object v2, p0, La21;->e:Ljava/lang/Object;

    check-cast v2, Li53;

    invoke-direct {v0, v1, v2, p1}, Lwjj;-><init>(Landroid/content/Context;Li53;Ljava/util/LinkedHashSet;)V

    iget-object p1, v0, Lwjj;->d:Ljava/lang/Object;

    check-cast p1, Lehc;

    invoke-virtual {p1}, Lehc;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_27

    return-void

    :cond_27
    iget-object v1, v0, Lwjj;->c:Ljava/lang/Object;

    check-cast v1, Lml3;

    if-nez v1, :cond_34

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Lal3;

    :cond_34
    if-eqz v1, :cond_3f

    invoke-interface {v1}, Lal3;->getId()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    goto :goto_40

    :cond_3f
    const/4 p1, 0x0

    :goto_40
    invoke-virtual {v0}, Lwjj;->h()Lpxh;

    move-result-object v0

    new-instance v1, Lrxh;

    const v2, 0x7f141364

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    new-instance v2, Leek;

    const/16 v3, 0xc

    invoke-direct {v2, p0, p1, v3}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, p0, La21;->l:Ljava/lang/Object;

    check-cast p1, Lr2f;

    if-eqz p1, :cond_5f

    sget-object v3, Lhjm;->b:Lhjm;

    const/4 v4, 0x3

    invoke-virtual {p1, v3, v4}, Lo93;->b(Lhjm;I)V

    :cond_5f
    new-instance p1, Lhf;

    check-cast v0, Ltxh;

    invoke-direct {p1, v0, v1, v2}, Lhf;-><init>(Ltxh;Lrxh;Leek;)V

    iget-object p0, p0, La21;->i:Ljava/lang/Object;

    check-cast p0, Lysj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final n(Ljava/lang/Object;)V
    .registers 2

    iget-object p0, p0, La21;->g:Ljava/lang/Object;

    check-cast p0, Lt0g;

    invoke-virtual {p0, p1}, Lt0g;->setValue(Ljava/lang/Object;)V

    return-void
.end method

.method public o()V
    .registers 1

    return-void
.end method

.method public final o0(Ljava/lang/Iterable;ZZ)V
    .registers 7

    iget-object v0, p0, La21;->a:Ljava/lang/Object;

    check-cast v0, Lqdb;

    if-eqz p2, :cond_9

    sget-object v1, Lvr0;->r:Lvr0;

    goto :goto_b

    :cond_9
    sget-object v1, Lvr0;->t:Lvr0;

    :goto_b
    invoke-interface {v0, v1}, Lqdb;->b(Lvr0;)V

    new-instance v0, Lt6l;

    iget-object v1, p0, La21;->d:Ljava/lang/Object;

    check-cast v1, Lk6l;

    const/4 v2, 0x0

    invoke-direct {v0, v1, p2, p1, v2}, Lt6l;-><init>(Lk6l;ZLjava/lang/Iterable;B)V

    if-eqz p3, :cond_1d

    invoke-virtual {p0, v0}, La21;->q(Lr6l;)V

    :cond_1d
    return-void
.end method

.method public final onFailure(Lv84;Ljava/io/IOException;)V
    .registers 3

    new-instance p1, Lbl6;

    const/16 p2, 0x13

    invoke-direct {p1, p0, p2}, Lbl6;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->e(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onResponse(Lv84;Lpzh;)V
    .registers 6

    iget-object p1, p0, La21;->b:Ljava/lang/Object;

    check-cast p1, Ltcl;

    iget-boolean v0, p2, Lpzh;->q:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_27

    new-instance v0, Low3;

    const/4 v2, 0x1

    invoke-direct {v0, p0, p2, v2}, Low3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p1, v0}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p2

    new-instance v0, Luk6;

    const/16 v2, 0xd

    invoke-direct {v0, p0, v2}, Luk6;-><init>(Ljava/lang/Object;B)V

    check-cast p1, Lumi;

    invoke-virtual {p1, v0}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {p2, p0}, Lnml;->b(Lnml;)V

    invoke-virtual {p2, v1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    :cond_27
    invoke-virtual {p2}, Lpzh;->close()V

    new-instance p2, Lbl6;

    const/16 v0, 0x13

    invoke-direct {p2, p0, v0}, Lbl6;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, p2}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final p(Ljava/lang/Object;)V
    .registers 2

    iget-object p0, p0, La21;->h:Ljava/lang/Object;

    check-cast p0, Lt0g;

    invoke-virtual {p0, p1}, Lt0g;->setValue(Ljava/lang/Object;)V

    return-void
.end method

.method public final p0(I)V
    .registers 7

    iget-object v0, p0, La21;->a:Ljava/lang/Object;

    check-cast v0, Lqdb;

    sget-object v1, Lvr0;->l:Lvr0;

    invoke-interface {v0, v1}, Lqdb;->b(Lvr0;)V

    iget-object v0, p0, La21;->c:Ljava/lang/Object;

    check-cast v0, Lz77;

    new-instance v1, Ldw7;

    iget-object v2, p0, La21;->b:Ljava/lang/Object;

    check-cast v2, Lkotlin/jvm/functions/Function0;

    invoke-interface {v2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Context;

    iget-object p0, p0, La21;->g:Ljava/lang/Object;

    check-cast p0, Lu4l;

    new-instance v3, Lthk;

    const/16 v4, 0xb

    invoke-direct {v3, v4}, Lthk;-><init>(B)V

    invoke-direct {v1, v2, p0, p1, v3}, Ldw7;-><init>(Landroid/content/Context;Lu4l;ILkotlin/jvm/functions/Function0;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v1, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final q(Lr6l;)V
    .registers 5

    iget-object v0, p0, La21;->l:Ljava/lang/Object;

    check-cast v0, Lr2f;

    if-eqz v0, :cond_c

    sget-object v1, Lhjm;->b:Lhjm;

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Lo93;->b(Lhjm;I)V

    :cond_c
    new-instance v0, Lr2f;

    invoke-direct {v0, p1}, Lr2f;-><init>(Lr6l;)V

    iput-object v0, p0, La21;->l:Ljava/lang/Object;

    iget-object p0, p0, La21;->i:Ljava/lang/Object;

    check-cast p0, Lysj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, p1}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final r(Lu3l;ILandroid/view/View;)V
    .registers 6

    new-instance v0, Lbl3;

    const/4 v1, 0x3

    invoke-direct {v0, p0, p1, p2, v1}, Lbl3;-><init>(Ljava/lang/Object;Ljava/lang/Object;IB)V

    new-instance p0, Lge;

    invoke-direct {p0, v0}, Lge;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, p3}, Lo73;->o(Landroid/view/View;)V

    return-void
.end method

.method public final w(Ljava/util/LinkedHashSet;)V
    .registers 4

    iget-object v0, p0, La21;->a:Ljava/lang/Object;

    check-cast v0, Lqdb;

    sget-object v1, Lvr0;->B:Lvr0;

    invoke-interface {v0, v1}, Lqdb;->b(Lvr0;)V

    new-instance v0, Lp8f;

    iget-object v1, p0, La21;->f:Ljava/lang/Object;

    check-cast v1, Lnr8;

    invoke-direct {v0, v1, p1}, Lp8f;-><init>(Lnr8;Ljava/util/LinkedHashSet;)V

    iget-object p1, v0, Lp8f;->c:Ljava/lang/Object;

    check-cast p1, Lehc;

    invoke-virtual {p1}, Lehc;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1d

    return-void

    :cond_1d
    invoke-virtual {p0, v0}, La21;->q(Lr6l;)V

    return-void
.end method

.method public final y()V
    .registers 1

    iget-object p0, p0, La21;->k:Ljava/lang/Object;

    check-cast p0, Lw9l;

    invoke-interface {p0}, Lw9l;->y()V

    return-void
.end method
