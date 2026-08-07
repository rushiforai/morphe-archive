.class public Ll/mk30$a;
.super Landroid/os/CountDownTimer;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/mk30;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/mk30;


# direct methods
.method public constructor <init>(Ll/mk30;JJ)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mk30$a;->a:Ll/mk30;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mk30$a;->a:Ll/mk30;

    .line 2
    .line 3
    invoke-static {p0}, Ll/mk30;->w(Ll/mk30;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onTick(J)V
    .locals 0

    .line 1
    return-void
.end method
