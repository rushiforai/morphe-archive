.class public final synthetic Ll/zyd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/azd;

.field public final synthetic b:Lcom/immomo/momomediaext/filter/DetectorType;


# direct methods
.method public synthetic constructor <init>(Ll/azd;Lcom/immomo/momomediaext/filter/DetectorType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zyd;->a:Ll/azd;

    iput-object p2, p0, Ll/zyd;->b:Lcom/immomo/momomediaext/filter/DetectorType;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zyd;->a:Ll/azd;

    iget-object p0, p0, Ll/zyd;->b:Lcom/immomo/momomediaext/filter/DetectorType;

    invoke-static {v0, p0}, Ll/azd;->a(Ll/azd;Lcom/immomo/momomediaext/filter/DetectorType;)V

    return-void
.end method
