.class public final synthetic Ll/mto;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ukb0;


# instance fields
.field public final synthetic a:Ll/vto;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/gcg0;

.field public final synthetic d:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/vto;Ljava/lang/String;Ll/gcg0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mto;->a:Ll/vto;

    iput-object p2, p0, Ll/mto;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/mto;->c:Ll/gcg0;

    iput-object p4, p0, Ll/mto;->d:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final b(Lcom/android/billingclient/api/d;Ljava/util/List;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/mto;->a:Ll/vto;

    iget-object v1, p0, Ll/mto;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/mto;->c:Ll/gcg0;

    iget-object v3, p0, Ll/mto;->d:Ljava/util/List;

    move-object v4, p1

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Ll/vto;->X(Ll/vto;Ljava/lang/String;Ll/gcg0;Ljava/util/List;Lcom/android/billingclient/api/d;Ljava/util/List;)V

    return-void
.end method
