.class public final Lhse;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Lix5;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Lnse;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lix5;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Lix5;-><init>(B)V

    sput-object v0, Lhse;->d:Lix5;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lnse;

    const/16 v1, 0x1f4

    sget-object v2, Lgse;->f:Lhv5;

    invoke-direct {v0, v1, v2}, Lnse;-><init>(ILlse;)V

    iput-object v0, p0, Lhse;->c:Lnse;

    sget-object v0, Laik;->a:[Ljava/lang/String;

    const-string v0, ""

    if-nez p1, :cond_15

    move-object p1, v0

    :cond_15
    iput-object p1, p0, Lhse;->a:Ljava/lang/String;

    if-nez p2, :cond_1a

    move-object p2, v0

    :cond_1a
    iput-object p2, p0, Lhse;->b:Ljava/lang/String;

    return-void
.end method
