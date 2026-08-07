.class public final synthetic Ll/fmt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hmt;

.field public final synthetic b:Lv/VRecyclerView;

.field public final synthetic c:Lv/VText;


# direct methods
.method public synthetic constructor <init>(Ll/hmt;Lv/VRecyclerView;Lv/VText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fmt;->a:Ll/hmt;

    iput-object p2, p0, Ll/fmt;->b:Lv/VRecyclerView;

    iput-object p3, p0, Ll/fmt;->c:Lv/VText;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fmt;->a:Ll/hmt;

    iget-object v1, p0, Ll/fmt;->b:Lv/VRecyclerView;

    iget-object p0, p0, Ll/fmt;->c:Lv/VText;

    invoke-static {v0, v1, p0}, Ll/hmt;->f(Ll/hmt;Lv/VRecyclerView;Lv/VText;)V

    return-void
.end method
