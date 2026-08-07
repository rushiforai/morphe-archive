.class public final synthetic Ll/lij;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/android/billingclient/api/a;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Ljava/lang/String;Lcom/android/billingclient/api/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lij;->a:Ljava/util/ArrayList;

    iput-object p2, p0, Ll/lij;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/lij;->c:Lcom/android/billingclient/api/a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lij;->a:Ljava/util/ArrayList;

    iget-object v1, p0, Ll/lij;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/lij;->c:Lcom/android/billingclient/api/a;

    check-cast p1, Ll/gcg0;

    invoke-static {v0, v1, p0, p1}, Ll/cjj;->b(Ljava/util/ArrayList;Ljava/lang/String;Lcom/android/billingclient/api/a;Ll/gcg0;)V

    return-void
.end method
