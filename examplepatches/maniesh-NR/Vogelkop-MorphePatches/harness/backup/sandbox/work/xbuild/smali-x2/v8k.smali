.class public final enum Lv8k;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lv8k;

.field public static final enum b:Lv8k;

.field public static final synthetic c:[Lv8k;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lv8k;

    const-string v1, "DEFAULT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lv8k;->a:Lv8k;

    new-instance v1, Lv8k;

    const-string v2, "VARIANT"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lv8k;->b:Lv8k;

    filled-new-array {v0, v1}, [Lv8k;

    move-result-object v0

    sput-object v0, Lv8k;->c:[Lv8k;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lv8k;
    .registers 2

    const-class v0, Lv8k;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lv8k;

    return-object p0
.end method

.method public static values()[Lv8k;
    .registers 1

    sget-object v0, Lv8k;->c:[Lv8k;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lv8k;

    return-object v0
.end method


# virtual methods
.method public final d(Landroid/content/Context;)I
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_12

    const/4 v0, 0x1

    if-ne p0, v0, :cond_d

    const p0, 0x7f0408db

    goto :goto_15

    :cond_d
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return p0

    :cond_12
    const p0, 0x7f0408da

    :goto_15
    const v0, 0x7f06063b

    invoke-static {p0, p1, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    return p0
.end method
