.class public final synthetic Ll/q480;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/t480;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/t480;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q480;->a:Ll/t480;

    iput-object p2, p0, Ll/q480;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q480;->a:Ll/t480;

    iget-object p0, p0, Ll/q480;->b:Ljava/util/List;

    invoke-static {v0, p0}, Ll/t480;->Z3(Ll/t480;Ljava/util/List;)V

    return-void
.end method
