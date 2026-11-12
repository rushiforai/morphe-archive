.class public final Lzh2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final a:Lqt3;

.field public final b:Ltcc;


# direct methods
.method public constructor <init>(Lqt3;Ltcc;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzh2;->a:Lqt3;

    iput-object p2, p0, Lzh2;->b:Ltcc;

    invoke-virtual {p2, p0}, Ltcc;->a(Lmdc;)V

    return-void
.end method


# virtual methods
.method public final onDestroy(Lndc;)V
    .registers 2

    iget-object p1, p0, Lzh2;->b:Ltcc;

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    sget-object p1, Lcom/opera/android/account/AuthExtension;->a:Li7f;

    invoke-virtual {p1, p0}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method
