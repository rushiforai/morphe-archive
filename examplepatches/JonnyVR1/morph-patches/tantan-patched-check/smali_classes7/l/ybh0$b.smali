.class public Ll/ybh0$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ybh0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:I

.field public b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(I)Ll/ybh0$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/ybh0$b;->a:I

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Lcom/p1/mobile/putong/data/User;)Ll/ybh0$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ybh0$b;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    new-instance v0, Ll/ybh0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/ybh0;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Ll/ybh0$b;->a:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/ybh0;->B0(I)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/ybh0$b;->b:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/ybh0;->a0(Ll/ybh0;Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ll/ybh0;->show()V

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/ybh0$b$a;

    .line 20
    .line 21
    invoke-direct {v1, p0, p1}, Ll/ybh0$b$a;-><init>(Ll/ybh0$b;Lcom/p1/mobile/android/app/Act;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/ybh0;->C0(Ll/x20;)V

    .line 25
    .line 26
    .line 27
    new-instance v1, Ll/ybh0$b$b;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1}, Ll/ybh0$b$b;-><init>(Ll/ybh0$b;Lcom/p1/mobile/android/app/Act;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
