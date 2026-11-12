.class public final enum Lxmn;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final c:Ldrj;

.field public static final enum d:Lxmn;

.field public static final synthetic e:[Lxmn;


# instance fields
.field public final a:I

.field public final b:I


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lxmn;

    const v1, 0x7f141456

    const v2, 0x7f141455

    const/4 v3, 0x0

    const-string v4, "DEFAULT"

    invoke-direct {v0, v3, v1, v2, v4}, Lxmn;-><init>(IIILjava/lang/String;)V

    sput-object v0, Lxmn;->d:Lxmn;

    new-instance v1, Lxmn;

    const v2, 0x7f140b17

    const v3, 0x7f140b18

    const/4 v4, 0x1

    const-string v5, "VERSION_2"

    invoke-direct {v1, v4, v2, v3, v5}, Lxmn;-><init>(IIILjava/lang/String;)V

    filled-new-array {v0, v1}, [Lxmn;

    move-result-object v0

    sput-object v0, Lxmn;->e:[Lxmn;

    new-instance v0, Lh58;

    new-instance v0, Ldrj;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Ldrj;-><init>(B)V

    sput-object v0, Lxmn;->c:Ldrj;

    return-void
.end method

.method public constructor <init>(IIILjava/lang/String;)V
    .registers 5

    invoke-direct {p0, p4, p1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p2, p0, Lxmn;->a:I

    iput p3, p0, Lxmn;->b:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lxmn;
    .registers 2

    const-class v0, Lxmn;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lxmn;

    return-object p0
.end method

.method public static values()[Lxmn;
    .registers 1

    sget-object v0, Lxmn;->e:[Lxmn;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lxmn;

    return-object v0
.end method
