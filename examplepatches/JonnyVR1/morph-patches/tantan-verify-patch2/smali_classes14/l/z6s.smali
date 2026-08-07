.class public final synthetic Ll/z6s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jcg0$b;


# instance fields
.field public final synthetic a:Ll/wbg0;


# direct methods
.method public synthetic constructor <init>(Ll/wbg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z6s;->a:Ll/wbg0;

    return-void
.end method


# virtual methods
.method public final onNext(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z6s;->a:Ll/wbg0;

    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    return-void
.end method
