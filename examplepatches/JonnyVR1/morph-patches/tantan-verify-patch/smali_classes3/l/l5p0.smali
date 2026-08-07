.class public final synthetic Ll/l5p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/media/ttmediautils/download/Action1;


# instance fields
.field public final synthetic a:Ll/e6p0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/e6p0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l5p0;->a:Ll/e6p0;

    iput-object p2, p0, Ll/l5p0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l5p0;->a:Ll/e6p0;

    iget-object p0, p0, Ll/l5p0;->b:Ljava/lang/String;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/e6p0;->F(Ll/e6p0;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
