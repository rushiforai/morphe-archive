.class public final synthetic Ll/jts0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Ll/y06;

.field public final synthetic b:Ll/x06;


# direct methods
.method public synthetic constructor <init>(Ll/y06;Ll/x06;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jts0;->a:Ll/y06;

    .line 5
    .line 6
    iput-object p2, p0, Ll/jts0;->b:Ll/x06;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jts0;->a:Ll/y06;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jts0;->b:Ll/x06;

    .line 4
    .line 5
    check-cast p1, Lcom/android/billingclient/api/d;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/x06;->a()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {v0, p1, p0}, Ll/y06;->f(Lcom/android/billingclient/api/d;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
