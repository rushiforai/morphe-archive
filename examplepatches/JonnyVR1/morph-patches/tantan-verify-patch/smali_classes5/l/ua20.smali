.class public final synthetic Ll/ua20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/y20;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ua20;->a:Ll/y20;

    iput-boolean p2, p0, Ll/ua20;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ua20;->a:Ll/y20;

    iget-boolean p0, p0, Ll/ua20;->b:Z

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsItemView;->h(Ll/y20;ZLl/uxj0;)V

    return-void
.end method
