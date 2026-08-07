.class public final synthetic Ll/ups0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Ll/am90;


# direct methods
.method public synthetic constructor <init>(Ll/am90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ups0;->a:Ll/am90;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p1, Lcom/android/billingclient/api/d;

    .line 2
    .line 3
    new-instance v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ups0;->a:Ll/am90;

    .line 9
    .line 10
    invoke-interface {p0, p1, v0}, Ll/am90;->a(Lcom/android/billingclient/api/d;Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
