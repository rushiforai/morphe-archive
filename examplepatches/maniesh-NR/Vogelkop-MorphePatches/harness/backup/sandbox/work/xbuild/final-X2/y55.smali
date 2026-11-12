.class public Ly55;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbl;
.implements Lhr3;
.implements Lm4f;
.implements Lj0n;
.implements Lf45;
.implements Llo7;
.implements Loeb;
.implements Ljv0;
.implements Lkuh;


# static fields
.field public static final a:Ly55;

.field public static final b:Ly55;

.field public static final c:Ly55;

.field public static final d:Ly55;

.field public static final e:Ly55;

.field public static final f:Ly55;

.field public static final g:Ly55;

.field public static final h:Ljava/lang/Object;

.field public static i:Lvk2;

.field public static final j:Luac;

.field public static k:Lj61;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 2

    new-instance v0, Ly55;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ly55;->a:Ly55;

    new-instance v0, Ly55;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ly55;->b:Ly55;

    new-instance v0, Ly55;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ly55;->c:Ly55;

    new-instance v0, Ly55;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ly55;->d:Ly55;

    new-instance v0, Ly55;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ly55;->e:Ly55;

    new-instance v0, Ly55;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ly55;->f:Ly55;

    new-instance v0, Ly55;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ly55;->g:Ly55;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ly55;->h:Ljava/lang/Object;

    new-instance v0, Luac;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Luac;-><init>(B)V

    sput-object v0, Ly55;->j:Luac;

    return-void
.end method

.method public static r(Lorb;)V
    .registers 5

    const-string v0, "type"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    const v3, 0x1a5de

    if-eq v2, v3, :cond_36

    const v3, 0x1bc64

    if-eq v2, v3, :cond_25

    const v3, 0x5a5ddf8

    if-ne v2, v3, :cond_42

    const-string v2, "close"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_42

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    return-void

    :cond_25
    const-string v2, "sev"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_42

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "id"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    return-void

    :cond_36
    const-string v2, "mev"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_42

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    return-void

    :cond_42
    const-string p0, "Unknown value for type"

    invoke-static {p0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-void
.end method

.method public static s(Lorb;)Lyuh;
    .registers 21

    move-object/from16 v0, p0

    const-string v1, "type"

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/4 v4, 0x0

    const-string v5, "status"

    const-string v6, "iso3"

    const-string v7, "event"

    const/4 v8, 0x0

    sparse-switch v3, :sswitch_data_42e

    goto/16 :goto_400

    :sswitch_19
    const-string v3, "navigation"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_400

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v0, v7}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v0

    const-string v1, "page"

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    const-string v4, "parameters"

    const-string v5, "impression"

    sparse-switch v3, :sswitch_data_450

    goto/16 :goto_24f

    :sswitch_3b
    const-string v3, "/destinations"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24f

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lwb8;->values()[Lwb8;

    move-result-object v1

    array-length v2, v1

    :goto_4f
    if-ge v8, v2, :cond_62

    aget-object v3, v1, v8

    sget-object v4, Lwb8;->b:Lwb8;

    if-eq v3, v4, :cond_5f

    iget-object v4, v3, Lwb8;->a:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_64

    :cond_5f
    add-int/lit8 v8, v8, 0x1

    goto :goto_4f

    :cond_62
    sget-object v3, Lwb8;->b:Lwb8;

    :cond_64
    new-instance v0, Lvb8;

    invoke-direct {v0, v3}, Lvb8;-><init>(Lwb8;)V

    goto/16 :goto_27c

    :sswitch_6b
    const-string v3, "/onboarding"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24f

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lxc8;->values()[Lxc8;

    move-result-object v1

    array-length v2, v1

    :goto_7f
    if-ge v8, v2, :cond_92

    aget-object v3, v1, v8

    sget-object v4, Lxc8;->b:Lxc8;

    if-eq v3, v4, :cond_8f

    iget-object v4, v3, Lxc8;->a:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_94

    :cond_8f
    add-int/lit8 v8, v8, 0x1

    goto :goto_7f

    :cond_92
    sget-object v3, Lxc8;->b:Lxc8;

    :cond_94
    new-instance v0, Lwc8;

    invoke-direct {v0, v3}, Lwc8;-><init>(Lxc8;)V

    goto/16 :goto_27c

    :sswitch_9b
    const-string v3, "/terms"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24f

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    new-instance v0, Lkd8;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_27c

    :sswitch_ad
    const-string v3, "/plans"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24f

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lad8;->values()[Lad8;

    move-result-object v1

    array-length v2, v1

    :goto_c1
    if-ge v8, v2, :cond_d4

    aget-object v3, v1, v8

    sget-object v4, Lad8;->b:Lad8;

    if-eq v3, v4, :cond_d1

    iget-object v4, v3, Lad8;->a:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_d6

    :cond_d1
    add-int/lit8 v8, v8, 0x1

    goto :goto_c1

    :cond_d4
    sget-object v3, Lad8;->b:Lad8;

    :cond_d6
    new-instance v0, Lzc8;

    invoke-direct {v0, v3}, Lzc8;-><init>(Lad8;)V

    goto/16 :goto_27c

    :sswitch_dd
    const-string v3, "/summary/:iso3"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24f

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v0, v4}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v1

    invoke-virtual {v1, v6}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljd8;

    invoke-direct {v2, v1}, Ljd8;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lid8;

    invoke-direct {v1, v2, v0}, Lid8;-><init>(Ljd8;Ljava/lang/String;)V

    :goto_fe
    move-object v0, v1

    goto/16 :goto_27c

    :sswitch_101
    const-string v3, "/ineligible"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24f

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lhc8;->values()[Lhc8;

    move-result-object v1

    array-length v2, v1

    :goto_115
    if-ge v8, v2, :cond_128

    aget-object v3, v1, v8

    sget-object v4, Lhc8;->b:Lhc8;

    if-eq v3, v4, :cond_125

    iget-object v4, v3, Lhc8;->a:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_12a

    :cond_125
    add-int/lit8 v8, v8, 0x1

    goto :goto_115

    :cond_128
    sget-object v3, Lhc8;->b:Lhc8;

    :cond_12a
    new-instance v0, Lgc8;

    invoke-direct {v0, v3}, Lgc8;-><init>(Lhc8;)V

    goto/16 :goto_27c

    :sswitch_131
    const-string v3, "/installation"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24f

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Ljc8;->values()[Ljc8;

    move-result-object v1

    array-length v2, v1

    :goto_145
    if-ge v8, v2, :cond_158

    aget-object v3, v1, v8

    sget-object v4, Ljc8;->b:Ljc8;

    if-eq v3, v4, :cond_155

    iget-object v4, v3, Ljc8;->a:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_15a

    :cond_155
    add-int/lit8 v8, v8, 0x1

    goto :goto_145

    :cond_158
    sget-object v3, Ljc8;->b:Ljc8;

    :cond_15a
    new-instance v0, Lic8;

    invoke-direct {v0, v3}, Lic8;-><init>(Ljc8;)V

    goto/16 :goto_27c

    :sswitch_161
    const-string v3, "/checkout/success"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24f

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Ltb8;->values()[Ltb8;

    move-result-object v1

    array-length v2, v1

    :goto_175
    if-ge v8, v2, :cond_188

    aget-object v3, v1, v8

    sget-object v4, Ltb8;->b:Ltb8;

    if-eq v3, v4, :cond_185

    iget-object v4, v3, Ltb8;->a:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_18a

    :cond_185
    add-int/lit8 v8, v8, 0x1

    goto :goto_175

    :cond_188
    sget-object v3, Ltb8;->b:Ltb8;

    :cond_18a
    new-instance v0, Lsb8;

    invoke-direct {v0, v3}, Lsb8;-><init>(Ltb8;)V

    goto/16 :goto_27c

    :sswitch_191
    const-string v3, "/destinations/:iso3"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24f

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v0, v4}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v1

    invoke-virtual {v1, v6}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lzb8;

    invoke-direct {v2, v1}, Lzb8;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lyb8;->values()[Lyb8;

    move-result-object v1

    array-length v3, v1

    :goto_1b2
    if-ge v8, v3, :cond_1c5

    aget-object v4, v1, v8

    sget-object v5, Lyb8;->b:Lyb8;

    if-eq v4, v5, :cond_1c2

    iget-object v5, v4, Lyb8;->a:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1c7

    :cond_1c2
    add-int/lit8 v8, v8, 0x1

    goto :goto_1b2

    :cond_1c5
    sget-object v4, Lyb8;->b:Lyb8;

    :cond_1c7
    new-instance v0, Lxb8;

    invoke-direct {v0, v2, v4}, Lxb8;-><init>(Lzb8;Lyb8;)V

    goto/16 :goto_27c

    :sswitch_1ce
    const-string v3, "/compatible-devices"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24f

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    new-instance v0, Lub8;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_27c

    :sswitch_1e0
    const-string v3, "/checkout/install"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24f

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lrb8;->values()[Lrb8;

    move-result-object v1

    array-length v2, v1

    :goto_1f4
    if-ge v8, v2, :cond_207

    aget-object v3, v1, v8

    sget-object v4, Lrb8;->b:Lrb8;

    if-eq v3, v4, :cond_204

    iget-object v4, v3, Lrb8;->a:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_209

    :cond_204
    add-int/lit8 v8, v8, 0x1

    goto :goto_1f4

    :cond_207
    sget-object v3, Lrb8;->b:Lrb8;

    :cond_209
    new-instance v0, Lqb8;

    invoke-direct {v0, v3}, Lqb8;-><init>(Lrb8;)V

    goto :goto_27c

    :sswitch_20f
    const-string v3, "/onboarding/nonfree"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24f

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    new-instance v0, Lyc8;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    goto :goto_27c

    :sswitch_220
    const-string v3, "/help"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24f

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    new-instance v0, Lfc8;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    goto :goto_27c

    :sswitch_231
    const-string v3, "/faq"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24f

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lbc8;

    invoke-direct {v1, v0}, Lbc8;-><init>(Ljava/lang/String;)V

    goto/16 :goto_fe

    :sswitch_247
    const-string v3, "/checkout"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_255

    :cond_24f
    :goto_24f
    new-instance v0, Lfke;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    goto :goto_27c

    :cond_255
    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v4}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v0

    invoke-virtual {v0, v6}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "days"

    iget-object v4, v0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v3

    const-string v5, "gigas"

    invoke-virtual {v0, v5}, Lorb;->l(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    new-instance v5, Lpb8;

    invoke-direct {v5, v3, v4, v0, v2}, Lpb8;-><init>(JLjava/lang/Long;Ljava/lang/String;)V

    new-instance v0, Lob8;

    invoke-direct {v0, v1, v5}, Lob8;-><init>(Ljava/lang/String;Lpb8;)V

    :goto_27c
    new-instance v1, Lewf;

    invoke-direct {v1, v0}, Lewf;-><init>(Lvje;)V

    return-object v1

    :sswitch_282
    const-string v3, "button_click"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_400

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    const-string v1, "button"

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ly14;

    invoke-direct {v1, v0}, Ly14;-><init>(Ljava/lang/String;)V

    return-object v1

    :sswitch_299
    const-string v3, "time_event"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_400

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v0, v7}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lrpl;->values()[Lrpl;

    move-result-object v2

    array-length v3, v2

    :goto_2ad
    if-ge v8, v3, :cond_2c0

    aget-object v4, v2, v8

    sget-object v5, Lrpl;->b:Lrpl;

    if-eq v4, v5, :cond_2bd

    iget-object v5, v4, Lrpl;->a:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2c2

    :cond_2bd
    add-int/lit8 v8, v8, 0x1

    goto :goto_2ad

    :cond_2c0
    sget-object v4, Lrpl;->b:Lrpl;

    :cond_2c2
    const-string v1, "time"

    iget-object v0, v0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    new-instance v2, Lqpl;

    invoke-direct {v2, v4, v0, v1}, Lqpl;-><init>(Lrpl;J)V

    return-object v2

    :sswitch_2d0
    const-string v3, "card_status"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_400

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    const-string v2, "cards"

    invoke-virtual {v0, v2}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v0

    iget-object v2, v0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    :goto_2ec
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_328

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v6

    invoke-virtual {v6, v5, v4}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_304

    move-object v11, v4

    goto :goto_31f

    :cond_304
    invoke-static {}, Lok4;->values()[Lok4;

    move-result-object v7

    array-length v9, v7

    move v10, v8

    :goto_30a
    if-ge v10, v9, :cond_31d

    aget-object v11, v7, v10

    sget-object v12, Lok4;->b:Lok4;

    if-eq v11, v12, :cond_31a

    iget-object v12, v11, Lok4;->a:Ljava/lang/String;

    invoke-virtual {v6, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_31f

    :cond_31a
    add-int/lit8 v10, v10, 0x1

    goto :goto_30a

    :cond_31d
    sget-object v11, Lok4;->b:Lok4;

    :cond_31f
    :goto_31f
    new-instance v6, Lmk4;

    invoke-direct {v6, v11}, Lmk4;-><init>(Lok4;)V

    invoke-interface {v1, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2ec

    :cond_328
    new-instance v0, Lnk4;

    invoke-direct {v0, v1}, Lnk4;-><init>(Ljava/util/LinkedHashMap;)V

    return-object v0

    :sswitch_32e
    const-string v3, "latest_free_plan"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_400

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    const-string v1, "plan"

    invoke-virtual {v0, v1}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v0

    iget-object v1, v0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v0, v6}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v2, "dataAmount"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v11

    const-string v2, "duration"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v13

    const-string v2, "activationTime"

    invoke-virtual {v0, v2}, Lorb;->l(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v15

    const-string v2, "usedDataAmount"

    const-wide/high16 v6, 0x7ff8000000000000L    # Double.NaN

    invoke-virtual {v1, v2, v6, v7}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-eqz v3, :cond_368

    move-object/from16 v16, v4

    goto :goto_36e

    :cond_368
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    move-object/from16 v16, v1

    :goto_36e
    const-string v1, "isFreePlan"

    invoke-virtual {v0, v1}, Lorb;->k(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v17

    const-string v1, "externalId"

    invoke-virtual {v0, v1, v4}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-virtual {v0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lip9;->values()[Lip9;

    move-result-object v1

    array-length v2, v1

    :goto_383
    if-ge v8, v2, :cond_399

    aget-object v3, v1, v8

    sget-object v4, Lip9;->b:Lip9;

    if-eq v3, v4, :cond_396

    iget-object v4, v3, Lip9;->a:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_396

    :goto_393
    move-object/from16 v19, v3

    goto :goto_39c

    :cond_396
    add-int/lit8 v8, v8, 0x1

    goto :goto_383

    :cond_399
    sget-object v3, Lip9;->b:Lip9;

    goto :goto_393

    :goto_39c
    new-instance v9, Lgp9;

    invoke-direct/range {v9 .. v19}, Lgp9;-><init>(Ljava/lang/String;DJLjava/lang/Long;Ljava/lang/Double;Ljava/lang/Boolean;Ljava/lang/String;Lip9;)V

    new-instance v0, Lhp9;

    invoke-direct {v0, v9}, Lhp9;-><init>(Lgp9;)V

    return-object v0

    :sswitch_3a7
    const-string v3, "user_properties"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_400

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    const-string v1, "totalPurchases"

    invoke-virtual {v0, v1}, Lorb;->l(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    new-instance v1, Lkum;

    invoke-direct {v1, v0}, Lkum;-><init>(Ljava/lang/Long;)V

    return-object v1

    :sswitch_3be
    const-string v3, "paid_plans"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_400

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    const-string v2, "plans"

    invoke-virtual {v0, v2}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v0

    iget-object v2, v0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    :goto_3da
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3f2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v4

    invoke-static {v4}, Lfsp;->o(Lorb;)Lc98;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3da

    :cond_3f2
    new-instance v0, Leyf;

    invoke-direct {v0, v1}, Leyf;-><init>(Ljava/util/LinkedHashMap;)V

    return-object v0

    :sswitch_3f8
    const-string v3, "purchase_flow"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_406

    :cond_400
    :goto_400
    new-instance v0, Lavh;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-object v0

    :cond_406
    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v0, v7}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lxah;->values()[Lxah;

    move-result-object v1

    array-length v2, v1

    :goto_412
    if-ge v8, v2, :cond_425

    aget-object v3, v1, v8

    sget-object v4, Lxah;->b:Lxah;

    if-eq v3, v4, :cond_422

    iget-object v4, v3, Lxah;->a:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_427

    :cond_422
    add-int/lit8 v8, v8, 0x1

    goto :goto_412

    :cond_425
    sget-object v3, Lxah;->b:Lxah;

    :cond_427
    new-instance v0, Lwah;

    invoke-direct {v0, v3}, Lwah;-><init>(Lxah;)V

    return-object v0

    nop

    :sswitch_data_42e
    .sparse-switch
        -0x4eee5254 -> :sswitch_3f8
        -0x42ca8c9 -> :sswitch_3be
        0x18623a27 -> :sswitch_3a7
        0x21b55e64 -> :sswitch_32e
        0x2af1c001 -> :sswitch_2d0
        0x42f11aa8 -> :sswitch_299
        0x4c22a23b -> :sswitch_282
        0x6f060a14 -> :sswitch_19
    .end sparse-switch

    :sswitch_data_450
    .sparse-switch
        -0x6bd4518b -> :sswitch_247
        0x16e887 -> :sswitch_231
        0x2c71ff0 -> :sswitch_220
        0x518ad34 -> :sswitch_20f
        0x6e9cc01 -> :sswitch_1e0
        0x18ce4953 -> :sswitch_1ce
        0x2200d18d -> :sswitch_191
        0x22f0e669 -> :sswitch_161
        0x437b8fe9 -> :sswitch_131
        0x4385236b -> :sswitch_101
        0x4e066810 -> :sswitch_dd
        0x56909f9b -> :sswitch_ad
        0x56c60eb8 -> :sswitch_9b
        0x573f078a -> :sswitch_6b
        0x78106fd4 -> :sswitch_3b
    .end sparse-switch
.end method

.method public static t(Lu2j;Lnx5;Lkotlin/jvm/functions/Function0;)Lie6;
    .registers 7

    sget-object v0, Ll08;->a:Ll08;

    new-instance v1, Lw19;

    invoke-direct {v1, p0, p2}, Lw19;-><init>(Lu2j;Lkotlin/jvm/functions/Function0;)V

    new-instance p0, La36;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p2, Lr3;

    const/4 v2, 0x0

    const/16 v3, 0x19

    invoke-direct {p2, v3, v2, v0}, Lr3;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    new-instance v0, Lie6;

    invoke-direct {v0, v1, p2, p0, p1}, Lie6;-><init>(Lgdk;Ljava/util/List;Lxx5;Lnx5;)V

    return-object v0
.end method

.method public static w()Lu56;
    .registers 6

    new-instance v0, Lu56;

    const/16 v1, 0xb

    const/16 v2, 0x88c

    const/4 v3, -0x1

    invoke-direct {v0, v2, v3, v1}, Ljf0;-><init>(III)V

    const/4 v1, 0x2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v0, v1, v3, v4, v5}, Ljf0;->p(IIJ)V

    return-object v0
.end method

.method public static y(Ljava/lang/String;)Ljy3;
    .registers 4

    sget-object v0, Ljy3;->e:Lh58;

    invoke-static {v0, v0}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object v0

    :cond_6
    invoke-virtual {v0}, Lw4;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-virtual {v0}, Lw4;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Ljy3;

    iget-object v2, v2, Ljy3;->a:Ljava/lang/String;

    invoke-virtual {v2, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    goto :goto_1d

    :cond_1c
    const/4 v1, 0x0

    :goto_1d
    check-cast v1, Ljy3;

    return-object v1
.end method

.method public static z(Lorb;Lala;Lisd;)V
    .registers 16

    move-object v7, p2

    const-string v8, "method"

    invoke-static {p0}, Lkfo;->O(Lorb;)Lgsb;

    move-result-object v9

    :try_start_7
    invoke-virtual {p0, v8}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1
    :try_end_f
    .catchall {:try_start_7 .. :try_end_f} :catchall_170

    const/4 v3, 0x5

    const/4 v4, 0x4

    const/4 v10, 0x3

    const/4 v5, 0x0

    const-string v6, "params"

    const/4 v11, 0x0

    sparse-switch v1, :sswitch_data_17e

    goto/16 :goto_150

    :sswitch_1b
    :try_start_1b
    const-string v1, "views.v1.getHostState"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_150

    new-instance v0, Lcka;

    invoke-direct {v0, v9, p2, v5}, Lcka;-><init>(Lgsb;Lisd;B)V

    iget-object v1, p1, Lala;->b:Ljava/lang/Object;

    check-cast v1, Lddc;

    new-instance v3, Lmz9;

    invoke-direct {v3, v0, p1, v11, v4}, Lmz9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v1, v11, v11, v3, v10}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void

    :sswitch_35
    const-string v1, "views.v1.notifyEsimStateChanged"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_150

    invoke-virtual {p0, v6}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v0

    invoke-virtual {v0, v5}, Lvpb;->c(I)Lorb;

    move-result-object v0

    const-string v1, "state"

    invoke-virtual {v0, v1}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v0

    invoke-static {v0}, Lvtp;->x(Lorb;)Lv98;

    move-result-object v4

    new-instance v0, Lcka;

    const/4 v1, 0x1

    invoke-direct {v0, v9, p2, v1}, Lcka;-><init>(Lgsb;Lisd;B)V

    iget-object v1, p1, Lala;->b:Ljava/lang/Object;

    move-object v12, v1

    check-cast v12, Lddc;

    new-instance v1, Ls71;

    const/16 v6, 0x17

    move-object v3, p1

    move-object v2, v0

    move-object v5, v11

    invoke-direct/range {v1 .. v6}, Ls71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    move-object v2, v5

    invoke-static {v12, v2, v2, v1, v10}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void

    :sswitch_69
    const-string v2, "views.v1.activateEsim"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_150

    new-instance v2, Lcka;

    invoke-direct {v2, v9, p2, v10}, Lcka;-><init>(Lgsb;Lisd;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_79
    .catchall {:try_start_1b .. :try_end_79} :catchall_170

    :try_start_79
    sget-object v0, Lt0i;->b:Lp0i;

    iget-object v0, p1, Lala;->i:Ljava/lang/Object;

    check-cast v0, Lbp6;

    iget-object v1, p1, Lala;->a:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/esim/ui/EsimActivity;

    iget-object v0, v0, Lbp6;->a:Ldp6;

    iget-object v0, v0, Ldp6;->i:Lk51;

    invoke-virtual {v0, v1}, Lk51;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_8c
    .catchall {:try_start_79 .. :try_end_8c} :catchall_8d

    goto :goto_96

    :catchall_8d
    move-exception v0

    :try_start_8e
    sget-object v1, Lt0i;->b:Lp0i;

    new-instance v1, Lq0i;

    invoke-direct {v1, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v1

    :goto_96
    invoke-static {v0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v1

    if-nez v1, :cond_a6

    new-instance v1, Lsw7;

    invoke-direct {v1, v0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v2, v1}, Lcka;->n(Ltw7;)V

    goto/16 :goto_17c

    :cond_a6
    new-instance v0, Ldqb;

    invoke-direct {v0, v1}, Ldqb;-><init>(Ljava/lang/Throwable;)V

    new-instance v1, Lrw7;

    invoke-direct {v1, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v2, v1}, Lcka;->n(Ltw7;)V

    goto/16 :goto_17c

    :sswitch_b5
    const-string v2, "views.v1.installEsim"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_150

    invoke-virtual {p0, v6}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v0

    invoke-virtual {v0, v5}, Lvpb;->c(I)Lorb;

    move-result-object v0

    const-string v2, "smDpAddress"

    invoke-virtual {v0, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "activationCode"

    invoke-virtual {v0, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v3, Lcka;

    invoke-direct {v3, v9, p2, v4}, Lcka;-><init>(Lgsb;Lisd;B)V

    invoke-virtual {p1, v2, v0, v3}, Lala;->q(Ljava/lang/String;Ljava/lang/String;Lcka;)V

    return-void

    :sswitch_da
    move-object v2, v11

    const-string v4, "views.v1.getIntegrityToken"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_150

    invoke-virtual {p0, v6}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v0

    invoke-virtual {v0, v5}, Lvpb;->c(I)Lorb;

    move-result-object v0

    const-string v4, "expectedHash"

    invoke-virtual {v0, v4}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v4, Lcka;

    invoke-direct {v4, v9, p2, v3}, Lcka;-><init>(Lgsb;Lisd;B)V

    iget-object v3, p1, Lala;->b:Ljava/lang/Object;

    move-object v11, v3

    check-cast v11, Lddc;

    new-instance v1, Lmz9;

    const/4 v6, 0x5

    move-object v3, v0

    move-object v5, v2

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, Lmz9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v11, v5, v5, v1, v10}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void

    :sswitch_108
    const-string v1, "analytics.v1.reportEvent"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_150

    invoke-virtual {p0, v6}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v0

    invoke-virtual {v0, v5}, Lvpb;->c(I)Lorb;

    move-result-object v0

    const-string v1, "event"

    invoke-virtual {v0, v1}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v0

    invoke-static {v0}, Ly55;->s(Lorb;)Lyuh;

    move-result-object v0

    new-instance v1, Lcka;

    const/4 v3, 0x7

    invoke-direct {v1, v9, p2, v3}, Lcka;-><init>(Lgsb;Lisd;B)V

    invoke-virtual {p1, v0, v1}, Lala;->d(Lyuh;Lcka;)V

    return-void

    :sswitch_12c
    const-string v1, "views.v1.getCrashId"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_150

    new-instance v0, Lcka;

    const/4 v1, 0x2

    invoke-direct {v0, v9, p2, v1}, Lcka;-><init>(Lgsb;Lisd;B)V

    iget-object v1, p1, Lala;->f:Ljava/lang/Object;

    check-cast v1, Lwyn;

    new-instance v2, Ly0a;

    invoke-direct {v2, v0, v3}, Ly0a;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lwyn;->a(Lcom/opera/api/Callback;)V

    return-void

    :sswitch_147
    move-object v5, v11

    const-string v1, "views.v1.markOnboardingSeen"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15d

    :cond_150
    :goto_150
    new-instance v0, Lcqb;

    const-string v1, "Method not found"

    const/16 v2, -0x7f59

    invoke-direct {v0, v2, v1}, Lcqb;-><init>(ILjava/lang/String;)V

    invoke-static {v9, v0, p2}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    return-void

    :cond_15d
    new-instance v0, Lcka;

    const/4 v1, 0x6

    invoke-direct {v0, v9, p2, v1}, Lcka;-><init>(Lgsb;Lisd;B)V

    iget-object v3, p1, Lala;->b:Ljava/lang/Object;

    check-cast v3, Lddc;

    new-instance v4, Lmz9;

    invoke-direct {v4, p1, v0, v5, v1}, Lmz9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v3, v5, v5, v4, v10}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;
    :try_end_16f
    .catchall {:try_start_8e .. :try_end_16f} :catchall_170

    return-void

    :catchall_170
    move-exception v0

    new-instance v1, Ldqb;

    invoke-direct {v1, v0}, Ldqb;-><init>(Ljava/lang/Throwable;)V

    :try_start_176
    invoke-virtual {p0, v8}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;
    :try_end_179
    .catch Lorg/json/JSONException; {:try_start_176 .. :try_end_179} :catch_179

    :catch_179
    invoke-static {v9, v1, p2}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    :goto_17c
    return-void

    nop

    :sswitch_data_17e
    .sparse-switch
        -0x5a08e5ca -> :sswitch_147
        -0x4cfa6341 -> :sswitch_12c
        -0x4b9d8dc5 -> :sswitch_108
        0x223aba6f -> :sswitch_da
        0x4aeaf31a -> :sswitch_b5
        0x535456f8 -> :sswitch_69
        0x5df67711 -> :sswitch_35
        0x6e94b226 -> :sswitch_1b
    .end sparse-switch
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final b(Loj9;)I
    .registers 4

    iget-object p0, p1, Loj9;->n:Ljava/lang/String;

    const-string v0, "audio/flac"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_54

    const-string v0, "audio/mp4a-latm"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_54

    const-string v0, "audio/mpeg"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_54

    const-string v0, "audio/opus"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_54

    const-string v0, "audio/vorbis"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_54

    const-string v0, "audio/wav"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_54

    const-string v0, "audio/webm"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_54

    const-string v0, "audio/mp4"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_54

    invoke-static {p0}, Ldzd;->k(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_4f

    const/4 p0, 0x1

    invoke-static {p0, v1, v1, v1}, Lkuh;->g(IIII)I

    move-result p0

    return p0

    :cond_4f
    invoke-static {v1, v1, v1, v1}, Lkuh;->g(IIII)I

    move-result p0

    return p0

    :cond_54
    iget p0, p1, Loj9;->O:I

    if-nez p0, :cond_5a

    const/4 p0, 0x4

    goto :goto_5b

    :cond_5a
    const/4 p0, 0x2

    :goto_5b
    invoke-static {p0, v1, v1, v1}, Lkuh;->g(IIII)I

    move-result p0

    return p0
.end method

.method public final c(Landroid/app/Activity;)Landroid/graphics/Rect;
    .registers 12

    sget-object p0, Lhr3;->Fo:Lpsp;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    :try_start_11
    const-class v4, Landroid/content/res/Configuration;

    const-string v5, "windowConfiguration"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    invoke-virtual {v4, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1}, Landroid/app/Activity;->isInMultiWindowMode()Z

    move-result v4

    if-eqz v4, :cond_3a

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "getBounds"

    invoke-virtual {v4, v5, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    invoke-virtual {v4, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    goto :goto_6e

    :cond_3a
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "getAppBounds"

    invoke-virtual {v4, v5, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    invoke-virtual {v4, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_4d} :catch_4e

    goto :goto_6e

    :catch_4e
    move-exception v1

    instance-of v4, v1, Ljava/lang/NoSuchFieldException;

    if-nez v4, :cond_60

    instance-of v4, v1, Ljava/lang/NoSuchMethodException;

    if-nez v4, :cond_60

    instance-of v4, v1, Ljava/lang/IllegalAccessException;

    if-nez v4, :cond_60

    instance-of v4, v1, Ljava/lang/reflect/InvocationTargetException;

    if-nez v4, :cond_60

    throw v1

    :cond_60
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getRectSize(Landroid/graphics/Rect;)V

    :goto_6e
    invoke-virtual {p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    new-instance v4, Landroid/graphics/Point;

    invoke-direct {v4}, Landroid/graphics/Point;-><init>()V

    invoke-virtual {v1, v4}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    invoke-virtual {p1}, Landroid/app/Activity;->isInMultiWindowMode()Z

    move-result v5

    const/4 v6, 0x0

    if-nez v5, :cond_b5

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const-string v7, "dimen"

    const-string v8, "android"

    const-string v9, "navigation_bar_height"

    invoke-virtual {v5, v9, v7, v8}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v7

    if-lez v7, :cond_9a

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    goto :goto_9b

    :cond_9a
    move v5, v6

    :goto_9b
    iget v7, v0, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v7, v5

    iget v8, v4, Landroid/graphics/Point;->y:I

    if-ne v7, v8, :cond_a5

    iput v7, v0, Landroid/graphics/Rect;->bottom:I

    goto :goto_b5

    :cond_a5
    iget v7, v0, Landroid/graphics/Rect;->right:I

    add-int/2addr v7, v5

    iget v8, v4, Landroid/graphics/Point;->x:I

    if-ne v7, v8, :cond_af

    iput v7, v0, Landroid/graphics/Rect;->right:I

    goto :goto_b5

    :cond_af
    iget v7, v0, Landroid/graphics/Rect;->left:I

    if-ne v7, v5, :cond_b5

    iput v6, v0, Landroid/graphics/Rect;->left:I

    :cond_b5
    :goto_b5
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v5

    iget v7, v4, Landroid/graphics/Point;->x:I

    if-lt v5, v7, :cond_c5

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v5

    iget v7, v4, Landroid/graphics/Point;->y:I

    if-ge v5, v7, :cond_16c

    :cond_c5
    invoke-virtual {p1}, Landroid/app/Activity;->isInMultiWindowMode()Z

    move-result p1

    if-nez p1, :cond_16c

    :try_start_cb
    const-string p1, "android.view.DisplayInfo"

    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    invoke-virtual {p1, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v7, "getDisplayInfo"

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v5, v1, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v5, "displayCutout"

    invoke-virtual {v1, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    instance-of v1, p1, Landroid/view/DisplayCutout;

    if-eqz v1, :cond_12e

    check-cast p1, Landroid/view/DisplayCutout;
    :try_end_10f
    .catch Ljava/lang/Exception; {:try_start_cb .. :try_end_10f} :catch_111

    move-object v3, p1

    goto :goto_12e

    :catch_111
    move-exception p1

    instance-of v1, p1, Ljava/lang/ClassNotFoundException;

    if-nez v1, :cond_12b

    instance-of v1, p1, Ljava/lang/NoSuchMethodException;

    if-nez v1, :cond_12b

    instance-of v1, p1, Ljava/lang/NoSuchFieldException;

    if-nez v1, :cond_12b

    instance-of v1, p1, Ljava/lang/IllegalAccessException;

    if-nez v1, :cond_12b

    instance-of v1, p1, Ljava/lang/reflect/InvocationTargetException;

    if-nez v1, :cond_12b

    instance-of v1, p1, Ljava/lang/InstantiationException;

    if-nez v1, :cond_12b

    throw p1

    :cond_12b
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_12e
    :goto_12e
    if-eqz v3, :cond_16c

    iget p0, v0, Landroid/graphics/Rect;->left:I

    invoke-virtual {v3}, Landroid/view/DisplayCutout;->getSafeInsetLeft()I

    move-result p1

    if-ne p0, p1, :cond_13a

    iput v6, v0, Landroid/graphics/Rect;->left:I

    :cond_13a
    iget p0, v4, Landroid/graphics/Point;->x:I

    iget p1, v0, Landroid/graphics/Rect;->right:I

    sub-int/2addr p0, p1

    invoke-virtual {v3}, Landroid/view/DisplayCutout;->getSafeInsetRight()I

    move-result p1

    if-ne p0, p1, :cond_14e

    iget p0, v0, Landroid/graphics/Rect;->right:I

    invoke-virtual {v3}, Landroid/view/DisplayCutout;->getSafeInsetRight()I

    move-result p1

    add-int/2addr p1, p0

    iput p1, v0, Landroid/graphics/Rect;->right:I

    :cond_14e
    iget p0, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v3}, Landroid/view/DisplayCutout;->getSafeInsetTop()I

    move-result p1

    if-ne p0, p1, :cond_158

    iput v6, v0, Landroid/graphics/Rect;->top:I

    :cond_158
    iget p0, v4, Landroid/graphics/Point;->y:I

    iget p1, v0, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr p0, p1

    invoke-virtual {v3}, Landroid/view/DisplayCutout;->getSafeInsetBottom()I

    move-result p1

    if-ne p0, p1, :cond_16c

    iget p0, v0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v3}, Landroid/view/DisplayCutout;->getSafeInsetBottom()I

    move-result p1

    add-int/2addr p1, p0

    iput p1, v0, Landroid/graphics/Rect;->bottom:I

    :cond_16c
    return-object v0
.end method

.method public final e(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3

    const/4 p0, 0x0

    return p0
.end method

.method public final getName()Ljava/lang/String;
    .registers 1

    const-string p0, "Audio"

    return-object p0
.end method

.method public final getTrackType()I
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final h(Ljava/lang/String;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final i()Ljava/lang/String;
    .registers 1

    const-string p0, "expected an Int value"

    return-object p0
.end method

.method public final j(Ljava/util/List;Lx92;)V
    .registers 3

    return-void
.end method

.method public k(Ljava/lang/String;)Z
    .registers 3

    invoke-static {p1}, Lwqm;->I(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object p1, Llqm;->p:Llqm;

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    invoke-static {p0}, Lam2;->v(Lvx3;)V

    const/4 p0, 0x1

    return p0
.end method

.method public final l(Ljava/lang/String;)V
    .registers 2

    return-void
.end method

.method public final m(Lpna;Lkuk;)V
    .registers 6

    check-cast p2, Lcr9;

    iget-object p0, p1, Lpna;->d:Lmpa;

    sget-object p1, Lmpa;->i:Lc30;

    new-instance v0, Lx11;

    const/4 v1, 0x0

    const/16 v2, 0x9

    invoke-direct {v0, v2, v1, p2}, Lx11;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-virtual {p0, p1, v0}, Lcfg;->f(Lc30;Lcr9;)V

    return-void
.end method

.method public final n(Lesb;F)Ljava/lang/Object;
    .registers 6

    invoke-virtual {p1}, Lesb;->t()I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_c

    invoke-static {p1, p2}, Lxsb;->b(Lesb;F)Landroid/graphics/PointF;

    move-result-object p0

    return-object p0

    :cond_c
    const/4 v0, 0x3

    if-ne p0, v0, :cond_14

    invoke-static {p1, p2}, Lxsb;->b(Lesb;F)Landroid/graphics/PointF;

    move-result-object p0

    return-object p0

    :cond_14
    const/4 v0, 0x7

    if-ne p0, v0, :cond_33

    new-instance p0, Landroid/graphics/PointF;

    invoke-virtual {p1}, Lesb;->q()D

    move-result-wide v0

    double-to-float v0, v0

    mul-float/2addr v0, p2

    invoke-virtual {p1}, Lesb;->q()D

    move-result-wide v1

    double-to-float v1, v1

    mul-float/2addr v1, p2

    invoke-direct {p0, v0, v1}, Landroid/graphics/PointF;-><init>(FF)V

    :goto_28
    invoke-virtual {p1}, Lesb;->o()Z

    move-result p2

    if-eqz p2, :cond_32

    invoke-virtual {p1}, Lesb;->H()V

    goto :goto_28

    :cond_32
    return-object p0

    :cond_33
    invoke-static {p0}, Lo18;->w(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Cannot convert json to point. Next token is "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final q()Lneb;
    .registers 2

    sget-object p0, Ly55;->k:Lj61;

    if-nez p0, :cond_d

    new-instance p0, Lj61;

    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-direct {p0, v0}, Lj61;-><init>(Landroid/content/Context;)V

    sput-object p0, Ly55;->k:Lj61;

    :cond_d
    return-object p0
.end method

.method public final supportsMixedMimeTypeAdaptation()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final u()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final v()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final x(Landroid/content/Context;)Lno7;
    .registers 2

    new-instance p0, Lv1;

    invoke-direct {p0, p1}, Lv1;-><init>(Landroid/content/Context;)V

    return-object p0
.end method
