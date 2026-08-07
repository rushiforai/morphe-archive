.class public final synthetic Ll/c18;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c18;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-boolean p2, p0, Ll/c18;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c18;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-boolean p0, p0, Ll/c18;->b:Z

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/g;->w4(Lcom/p1/mobile/putong/core/api/g;ZLjava/lang/String;)V

    return-void
.end method
