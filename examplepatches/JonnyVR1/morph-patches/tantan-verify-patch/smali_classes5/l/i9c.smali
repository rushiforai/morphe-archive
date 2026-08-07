.class public final synthetic Ll/i9c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Envelope;

.field public final synthetic c:Z

.field public final synthetic d:Z

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Ll/x20;Lcom/p1/mobile/putong/data/Envelope;ZZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i9c;->a:Ll/x20;

    iput-object p2, p0, Ll/i9c;->b:Lcom/p1/mobile/putong/data/Envelope;

    iput-boolean p3, p0, Ll/i9c;->c:Z

    iput-boolean p4, p0, Ll/i9c;->d:Z

    iput-boolean p5, p0, Ll/i9c;->e:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/i9c;->a:Ll/x20;

    iget-object v1, p0, Ll/i9c;->b:Lcom/p1/mobile/putong/data/Envelope;

    iget-boolean v2, p0, Ll/i9c;->c:Z

    iget-boolean v3, p0, Ll/i9c;->d:Z

    iget-boolean p0, p0, Ll/i9c;->e:Z

    invoke-static {v0, v1, v2, v3, p0}, Ll/l9c;->a(Ll/x20;Lcom/p1/mobile/putong/data/Envelope;ZZZ)V

    return-void
.end method
