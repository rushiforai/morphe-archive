.class public final synthetic Ll/qi00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hj00;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/hj00;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qi00;->a:Ll/hj00;

    iput-object p2, p0, Ll/qi00;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/qi00;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/qi00;->d:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qi00;->a:Ll/hj00;

    iget-object v1, p0, Ll/qi00;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/qi00;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/qi00;->d:Ll/x20;

    check-cast p1, Lcom/p1/mobile/putong/data/StickerInfo;

    invoke-static {v0, v1, v2, p0, p1}, Ll/hj00;->t0(Ll/hj00;Ljava/lang/String;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/data/StickerInfo;)V

    return-void
.end method
