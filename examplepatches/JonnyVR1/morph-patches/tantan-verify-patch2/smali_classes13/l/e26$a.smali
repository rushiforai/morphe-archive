.class public Ll/e26$a;
.super Landroid/database/ContentObserver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/e26;->c(Landroid/net/Uri;ZLl/pcj;)Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/gcg0;

.field public final synthetic b:Ll/pcj;


# direct methods
.method public constructor <init>(Landroid/os/Handler;Ll/gcg0;Ll/pcj;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/e26$a;->a:Ll/gcg0;

    .line 2
    .line 3
    iput-object p3, p0, Ll/e26$a;->b:Ll/pcj;

    .line 4
    .line 5
    invoke-direct {p0, p1}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/e26$a;->a:Ll/gcg0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/e26$a;->b:Ll/pcj;

    .line 4
    .line 5
    invoke-interface {p1, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
