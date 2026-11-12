.class public final enum Ltfl;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic b:[Ltfl;


# instance fields
.field public final a:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Ltfl;

    sget-object v5, Lvtp;->g:Ljava/lang/Object;

    const v3, 0x1040003

    const v4, 0x1010311

    const-string v1, "Cut"

    const/4 v2, 0x0

    invoke-direct/range {v0 .. v5}, Ltfl;-><init>(Ljava/lang/String;IIILjava/lang/Object;)V

    new-instance v1, Ltfl;

    sget-object v6, Lvtp;->h:Ljava/lang/Object;

    const v4, 0x1040001

    const v5, 0x1010312

    const-string v2, "Copy"

    const/4 v3, 0x1

    invoke-direct/range {v1 .. v6}, Ltfl;-><init>(Ljava/lang/String;IIILjava/lang/Object;)V

    new-instance v2, Ltfl;

    sget-object v7, Lvtp;->i:Ljava/lang/Object;

    const v5, 0x104000b

    const v6, 0x1010313

    const-string v3, "Paste"

    const/4 v4, 0x2

    invoke-direct/range {v2 .. v7}, Ltfl;-><init>(Ljava/lang/String;IIILjava/lang/Object;)V

    new-instance v3, Ltfl;

    sget-object v8, Lvtp;->j:Ljava/lang/Object;

    const v6, 0x104000d

    const v7, 0x101037e

    const-string v4, "SelectAll"

    const/4 v5, 0x3

    invoke-direct/range {v3 .. v8}, Ltfl;-><init>(Ljava/lang/String;IIILjava/lang/Object;)V

    new-instance v4, Ltfl;

    sget-object v9, Lvtp;->k:Ljava/lang/Object;

    const v7, 0x104001a

    const/4 v8, 0x0

    const-string v5, "Autofill"

    const/4 v6, 0x4

    invoke-direct/range {v4 .. v9}, Ltfl;-><init>(Ljava/lang/String;IIILjava/lang/Object;)V

    filled-new-array {v0, v1, v2, v3, v4}, [Ltfl;

    move-result-object v0

    sput-object v0, Ltfl;->b:[Ltfl;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIILjava/lang/Object;)V
    .registers 6

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p5, p0, Ltfl;->a:Ljava/lang/Object;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ltfl;
    .registers 2

    const-class v0, Ltfl;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ltfl;

    return-object p0
.end method

.method public static values()[Ltfl;
    .registers 1

    sget-object v0, Ltfl;->b:[Ltfl;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ltfl;

    return-object v0
.end method
