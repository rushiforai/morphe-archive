.class public final enum Laxc;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum f:Laxc;

.field public static final synthetic g:[Laxc;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:B

.field public final d:B

.field public final e:B


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Laxc;

    sget-object v1, Lcxc;->k:Luac;

    const/16 v6, 0xc

    const/16 v7, 0xd

    const/4 v1, 0x0

    const-string v2, "V1"

    const v3, 0x7f141336

    const v4, 0x7f140ef7

    const/16 v5, 0xb

    invoke-direct/range {v0 .. v7}, Laxc;-><init>(ILjava/lang/String;IIIII)V

    sput-object v0, Laxc;->f:Laxc;

    new-instance v1, Laxc;

    const/16 v7, 0xf

    const/16 v8, 0x10

    const/4 v2, 0x1

    const-string v3, "V2"

    const v4, 0x7f140ef8

    const v5, 0x7f141334

    const/16 v6, 0xe

    invoke-direct/range {v1 .. v8}, Laxc;-><init>(ILjava/lang/String;IIIII)V

    new-instance v2, Laxc;

    const/16 v8, 0x12

    const/16 v9, 0x13

    const/4 v3, 0x2

    const-string v4, "V3"

    const v5, 0x7f140a63

    const v6, 0x7f141331

    const/16 v7, 0x11

    invoke-direct/range {v2 .. v9}, Laxc;-><init>(ILjava/lang/String;IIIII)V

    filled-new-array {v0, v1, v2}, [Laxc;

    move-result-object v0

    sput-object v0, Laxc;->g:[Laxc;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;IIIII)V
    .registers 8

    invoke-direct {p0, p2, p1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Laxc;->a:I

    iput p4, p0, Laxc;->b:I

    iput-byte p5, p0, Laxc;->c:B

    iput-byte p6, p0, Laxc;->d:B

    iput-byte p7, p0, Laxc;->e:B

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Laxc;
    .registers 2

    const-class v0, Laxc;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Laxc;

    return-object p0
.end method

.method public static values()[Laxc;
    .registers 1

    sget-object v0, Laxc;->g:[Laxc;

    invoke-virtual {v0}, [Laxc;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Laxc;

    return-object v0
.end method
