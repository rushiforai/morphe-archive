.class public final synthetic Ll/von0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vb3;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/vb3;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/von0;->a:Ll/vb3;

    iput-object p2, p0, Ll/von0;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/von0;->a:Ll/vb3;

    iget-object p0, p0, Ll/von0;->b:Ljava/util/List;

    check-cast p1, Ll/qrm0;

    invoke-static {v0, p0, p1}, Ll/won0;->Z3(Ll/vb3;Ljava/util/List;Ll/qrm0;)V

    return-void
.end method
