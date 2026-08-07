.class public final synthetic Ll/kf10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/of10;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/of10;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kf10;->a:Ll/of10;

    iput-object p2, p0, Ll/kf10;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kf10;->a:Ll/of10;

    iget-object p0, p0, Ll/kf10;->b:Ljava/util/List;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/of10;->M3(Ll/of10;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method
