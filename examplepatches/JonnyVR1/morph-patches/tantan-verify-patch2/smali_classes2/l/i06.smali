.class public final synthetic Ll/i06;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ll/j06;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ll/j06;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i06;->a:Ljava/util/List;

    iput-object p2, p0, Ll/i06;->b:Ll/j06;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i06;->a:Ljava/util/List;

    iget-object p0, p0, Ll/i06;->b:Ll/j06;

    invoke-static {v0, p0}, Ll/j06;->a(Ljava/util/List;Ll/j06;)V

    return-void
.end method
