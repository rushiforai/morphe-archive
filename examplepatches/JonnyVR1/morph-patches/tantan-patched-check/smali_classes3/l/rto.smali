.class public final synthetic Ll/rto;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ukb0;


# instance fields
.field public final synthetic a:Ll/vto;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/vto;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rto;->a:Ll/vto;

    iput-object p2, p0, Ll/rto;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/rto;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/rto;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final b(Lcom/android/billingclient/api/d;Ljava/util/List;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/rto;->a:Ll/vto;

    iget-object v1, p0, Ll/rto;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/rto;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/rto;->d:Ljava/lang/String;

    move-object v4, p1

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Ll/vto;->A(Ll/vto;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/billingclient/api/d;Ljava/util/List;)V

    return-void
.end method
