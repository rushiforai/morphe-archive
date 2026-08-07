.class public final synthetic Ll/hif0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/zif0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/x20;

.field public final synthetic d:Ll/kcg0;


# direct methods
.method public synthetic constructor <init>(Ll/zif0;Ljava/lang/String;Ll/x20;Ll/kcg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hif0;->a:Ll/zif0;

    iput-object p2, p0, Ll/hif0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/hif0;->c:Ll/x20;

    iput-object p4, p0, Ll/hif0;->d:Ll/kcg0;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hif0;->a:Ll/zif0;

    iget-object v1, p0, Ll/hif0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/hif0;->c:Ll/x20;

    iget-object p0, p0, Ll/hif0;->d:Ll/kcg0;

    invoke-static {v0, v1, v2, p0}, Ll/zif0;->F(Ll/zif0;Ljava/lang/String;Ll/x20;Ll/kcg0;)V

    return-void
.end method
