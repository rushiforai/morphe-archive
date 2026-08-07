.class public abstract Ll/ed00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xpy$b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/xpy$b<",
        "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
        ">;"
    }
.end annotation


# instance fields
.field private a:Ll/xpy$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/xpy$c<",
            "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ed00$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ed00$a;-><init>(Ll/ed00;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ed00;->a:Ll/xpy$c;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public b()Ll/xpy$c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/xpy$c<",
            "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ed00;->a:Ll/xpy$c;

    .line 2
    .line 3
    return-object p0
.end method
