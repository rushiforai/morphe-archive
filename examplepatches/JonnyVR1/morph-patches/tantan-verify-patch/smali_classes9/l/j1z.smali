.class public final synthetic Ll/j1z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/u1z;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/u1z;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j1z;->a:Ll/u1z;

    iput-object p2, p0, Ll/j1z;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j1z;->a:Ll/u1z;

    iget-object p0, p0, Ll/j1z;->b:Ljava/util/List;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/u1z;->z0(Ll/u1z;Ljava/util/List;Ljava/lang/Throwable;)V

    return-void
.end method
