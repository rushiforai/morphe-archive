.class public final synthetic Ll/iij;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(ZLjava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/iij;->a:Z

    iput-object p2, p0, Ll/iij;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/iij;->a:Z

    iget-object p0, p0, Ll/iij;->b:Ljava/util/ArrayList;

    check-cast p1, Lcom/android/billingclient/api/a;

    invoke-static {v0, p0, p1}, Ll/cjj;->w(ZLjava/util/ArrayList;Lcom/android/billingclient/api/a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
