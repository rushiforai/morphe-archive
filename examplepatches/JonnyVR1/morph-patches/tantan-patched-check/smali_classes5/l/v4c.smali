.class public final synthetic Ll/v4c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/z4c;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/z4c;Ll/x20;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v4c;->a:Ll/z4c;

    iput-object p2, p0, Ll/v4c;->b:Ll/x20;

    iput-object p3, p0, Ll/v4c;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v4c;->a:Ll/z4c;

    iget-object v1, p0, Ll/v4c;->b:Ll/x20;

    iget-object p0, p0, Ll/v4c;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/AccountErrorResponse;

    invoke-static {v0, v1, p0, p1}, Ll/z4c;->f0(Ll/z4c;Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/AccountErrorResponse;)V

    return-void
.end method
