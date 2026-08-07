.class public final synthetic Ll/rzm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/xzm0;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/xzm0;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rzm0;->a:Ll/xzm0;

    iput-object p2, p0, Ll/rzm0;->b:Landroid/content/Context;

    iput-object p3, p0, Ll/rzm0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/rzm0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rzm0;->a:Ll/xzm0;

    iget-object v1, p0, Ll/rzm0;->b:Landroid/content/Context;

    iget-object v2, p0, Ll/rzm0;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/rzm0;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Ll/xzm0;->b(Ll/xzm0;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
