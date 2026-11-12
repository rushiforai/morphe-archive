.class public final Lk0o;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Lk0o;


# instance fields
.field public final a:Lj0o;

.field public final b:Z

.field public final c:Lkotlin/jvm/functions/Function1;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lk0o;

    sget-object v1, Lj0o;->a:Lj0o;

    new-instance v2, Lq0n;

    const/16 v3, 0xc

    invoke-direct {v2, v3}, Lq0n;-><init>(B)V

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-direct {v0, v1, v4, v2, v3}, Lk0o;-><init>(Lj0o;ZLkotlin/jvm/functions/Function1;I)V

    sput-object v0, Lk0o;->d:Lk0o;

    return-void
.end method

.method public constructor <init>(Lj0o;ZLkotlin/jvm/functions/Function1;)V
    .registers 4

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lk0o;->a:Lj0o;

    .line 17
    iput-boolean p2, p0, Lk0o;->b:Z

    .line 18
    iput-object p3, p0, Lk0o;->c:Lkotlin/jvm/functions/Function1;

    return-void
.end method

.method public synthetic constructor <init>(Lj0o;ZLkotlin/jvm/functions/Function1;I)V
    .registers 6

    and-int/lit8 v0, p4, 0x1

    if-eqz v0, :cond_6

    sget-object p1, Lj0o;->b:Lj0o;

    :cond_6
    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_b

    const/4 p2, 0x0

    :cond_b
    invoke-direct {p0, p1, p2, p3}, Lk0o;-><init>(Lj0o;ZLkotlin/jvm/functions/Function1;)V

    return-void
.end method
