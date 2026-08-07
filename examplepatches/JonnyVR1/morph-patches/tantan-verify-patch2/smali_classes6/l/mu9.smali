.class public final synthetic Ll/mu9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/data/DbLinks;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;ILcom/p1/mobile/putong/data/DbLinks;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mu9;->a:Ljava/lang/String;

    iput p2, p0, Ll/mu9;->b:I

    iput-object p3, p0, Ll/mu9;->c:Lcom/p1/mobile/putong/data/DbLinks;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mu9;->a:Ljava/lang/String;

    iget v1, p0, Ll/mu9;->b:I

    iget-object p0, p0, Ll/mu9;->c:Lcom/p1/mobile/putong/data/DbLinks;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/feed/api/b;->E0(Ljava/lang/String;ILcom/p1/mobile/putong/data/DbLinks;)V

    return-void
.end method
