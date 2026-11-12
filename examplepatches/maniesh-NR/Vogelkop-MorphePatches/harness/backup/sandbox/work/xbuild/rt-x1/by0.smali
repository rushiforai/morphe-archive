.class public enum Lby0;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic f:[Lby0;

.field public static final synthetic g:Lh58;


# instance fields
.field public final a:B

.field public final b:Ljava/util/EnumSet;

.field public final c:Z

.field public final d:Ljava/lang/Integer;

.field public final e:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .registers 27

    new-instance v0, Lby0;

    sget-object v8, Lyx0;->g:Lyx0;

    sget-object v9, Lyx0;->h:Lyx0;

    invoke-static {v8, v9}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v4

    const v1, 0x7f140153

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    const/16 v7, 0x14

    const-string v1, "SUMMARIZE"

    const/4 v2, 0x0

    const/16 v3, 0x1e

    invoke-direct/range {v0 .. v7}, Lby0;-><init>(Ljava/lang/String;IILjava/util/EnumSet;Ljava/lang/Integer;Ljava/lang/Integer;I)V

    new-instance v10, Lby0;

    sget-object v1, Lyx0;->i:Lyx0;

    invoke-static {v8, v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v14

    const v2, 0x7f14015b

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    const/16 v16, 0x0

    const/16 v17, 0x14

    const-string v11, "TELL_ME_MORE"

    const/4 v12, 0x1

    const/16 v13, 0x1f

    invoke-direct/range {v10 .. v17}, Lby0;-><init>(Ljava/lang/String;IILjava/util/EnumSet;Ljava/lang/Integer;Ljava/lang/Integer;I)V

    new-instance v11, Lby0;

    invoke-static {v8, v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v15

    const v2, 0x7f140114

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    const/16 v17, 0x0

    const/16 v18, 0x14

    const-string v12, "EXPLAIN"

    const/4 v13, 0x2

    const/16 v14, 0x1b

    invoke-direct/range {v11 .. v18}, Lby0;-><init>(Ljava/lang/String;IILjava/util/EnumSet;Ljava/lang/Integer;Ljava/lang/Integer;I)V

    new-instance v12, Lby0;

    sget-object v2, Lyx0;->b:Lyx0;

    invoke-static {v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v16

    const v3, 0x7f120002

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    const/16 v19, 0xc

    const-string v13, "DESCRIBE_IMAGES"

    const/4 v14, 0x3

    const/16 v15, 0x1b

    invoke-direct/range {v12 .. v19}, Lby0;-><init>(Ljava/lang/String;IILjava/util/EnumSet;Ljava/lang/Integer;Ljava/lang/Integer;I)V

    new-instance v13, Lby0;

    invoke-static {v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v17

    const v3, 0x7f120003

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    const/16 v20, 0xc

    const-string v14, "EXTRACT_IMAGE_TEXT"

    const/4 v15, 0x4

    const/16 v16, 0x1b

    const/16 v18, 0x0

    invoke-direct/range {v13 .. v20}, Lby0;-><init>(Ljava/lang/String;IILjava/util/EnumSet;Ljava/lang/Integer;Ljava/lang/Integer;I)V

    new-instance v14, Lby0;

    invoke-static {v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v18

    const v2, 0x7f14015d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    const/16 v20, 0x0

    const/16 v21, 0x10

    const-string v15, "TRANSLATE_IMAGE_TEXT"

    const/16 v16, 0x5

    const/16 v17, 0x1b

    invoke-direct/range {v14 .. v21}, Lby0;-><init>(Ljava/lang/String;IILjava/util/EnumSet;Ljava/lang/Integer;Ljava/lang/Integer;I)V

    new-instance v15, Lay0;

    sget-object v2, Lyx0;->c:Lyx0;

    invoke-static {v2, v8, v9, v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v19

    const v1, 0x7f14015e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    const/16 v21, 0x0

    const/16 v22, 0x10

    const-string v16, "TRANSLATE_TO_LANGUAGE"

    const/16 v17, 0x6

    const/16 v18, 0x1b

    invoke-direct/range {v15 .. v22}, Lby0;-><init>(Ljava/lang/String;IILjava/util/EnumSet;Ljava/lang/Integer;Ljava/lang/Integer;I)V

    new-instance v16, Lby0;

    sget-object v1, Lyx0;->d:Lyx0;

    sget-object v3, Lyx0;->f:Lyx0;

    invoke-static {v2, v1, v3}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v20

    const v4, 0x7f120004

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    const/16 v23, 0xc

    const-string v17, "SUMMARIZE_FILES"

    const/16 v18, 0x7

    const/16 v19, 0x1b

    invoke-direct/range {v16 .. v23}, Lby0;-><init>(Ljava/lang/String;IILjava/util/EnumSet;Ljava/lang/Integer;Ljava/lang/Integer;I)V

    new-instance v17, Lby0;

    invoke-static {v2, v1, v3}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v21

    const v4, 0x7f1400fc

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    const/16 v23, 0x0

    const/16 v24, 0x14

    const-string v18, "ANALYZE_CONTENT"

    const/16 v19, 0x8

    const/16 v20, 0x1b

    invoke-direct/range {v17 .. v24}, Lby0;-><init>(Ljava/lang/String;IILjava/util/EnumSet;Ljava/lang/Integer;Ljava/lang/Integer;I)V

    new-instance v18, Lby0;

    invoke-static {v2, v1, v3}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v22

    const v1, 0x7f140116

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    const/16 v24, 0x0

    const/16 v25, 0x14

    const-string v19, "EXTRACT_KEY_INFORMATION"

    const/16 v20, 0x9

    const/16 v21, 0x1b

    invoke-direct/range {v18 .. v25}, Lby0;-><init>(Ljava/lang/String;IILjava/util/EnumSet;Ljava/lang/Integer;Ljava/lang/Integer;I)V

    new-instance v1, Lby0;

    sget-object v9, Lyx0;->e:Lyx0;

    invoke-static {v9}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v5

    const v2, 0x7f140154

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x0

    const/16 v8, 0x14

    const-string v2, "SUMMARIZE_PAGE"

    const/16 v3, 0xa

    const/16 v4, 0x1b

    invoke-direct/range {v1 .. v8}, Lby0;-><init>(Ljava/lang/String;IILjava/util/EnumSet;Ljava/lang/Integer;Ljava/lang/Integer;I)V

    new-instance v19, Lzx0;

    invoke-static {v9}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v23

    const/16 v25, 0x0

    const/16 v26, 0x1c

    const-string v20, "TRANSLATE_PAGE"

    const/16 v21, 0xb

    const/16 v22, 0x1b

    invoke-direct/range {v19 .. v26}, Lby0;-><init>(Ljava/lang/String;IILjava/util/EnumSet;Ljava/lang/Integer;Ljava/lang/Integer;I)V

    const/16 v2, 0xc

    new-array v2, v2, [Lby0;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v10, v2, v0

    const/4 v0, 0x2

    aput-object v11, v2, v0

    const/4 v0, 0x3

    aput-object v12, v2, v0

    const/4 v0, 0x4

    aput-object v13, v2, v0

    const/4 v0, 0x5

    aput-object v14, v2, v0

    const/4 v0, 0x6

    aput-object v15, v2, v0

    const/4 v0, 0x7

    aput-object v16, v2, v0

    const/16 v0, 0x8

    aput-object v17, v2, v0

    const/16 v0, 0x9

    aput-object v18, v2, v0

    const/16 v0, 0xa

    aput-object v1, v2, v0

    const/16 v0, 0xb

    aput-object v19, v2, v0

    sput-object v2, Lby0;->f:[Lby0;

    new-instance v0, Lh58;

    invoke-direct {v0, v2}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v0, Lby0;->g:Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IILjava/util/EnumSet;Ljava/lang/Integer;Ljava/lang/Integer;I)V
    .registers 11

    and-int/lit8 v0, p7, 0x4

    if-eqz v0, :cond_6

    const/4 v0, 0x0

    goto :goto_7

    :cond_6
    const/4 v0, 0x1

    :goto_7
    and-int/lit8 v1, p7, 0x8

    const/4 v2, 0x0

    if-eqz v1, :cond_d

    move-object p5, v2

    :cond_d
    and-int/lit8 p7, p7, 0x10

    if-eqz p7, :cond_12

    move-object p6, v2

    :cond_12
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p3, p0, Lby0;->a:B

    iput-object p4, p0, Lby0;->b:Ljava/util/EnumSet;

    iput-boolean v0, p0, Lby0;->c:Z

    iput-object p5, p0, Lby0;->d:Ljava/lang/Integer;

    iput-object p6, p0, Lby0;->e:Ljava/lang/Integer;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lby0;
    .registers 2

    const-class v0, Lby0;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lby0;

    return-object p0
.end method

.method public static values()[Lby0;
    .registers 1

    sget-object v0, Lby0;->f:[Lby0;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lby0;

    return-object v0
.end method


# virtual methods
.method public d(ILandroid/content/Context;)Ljava/lang/String;
    .registers 4

    iget-object v0, p0, Lby0;->d:Ljava/lang/Integer;

    if-eqz v0, :cond_d

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result p0

    invoke-virtual {p2, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_d
    iget-object p0, p0, Lby0;->e:Ljava/lang/Integer;

    if-eqz p0, :cond_1e

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, p0, p1}, Landroid/content/res/Resources;->getQuantityString(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1e
    const-string p0, ""

    return-object p0
.end method
