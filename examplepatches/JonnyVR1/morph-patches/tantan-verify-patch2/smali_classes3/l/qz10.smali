.class public final synthetic Ll/qz10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/xz10;

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ll/xz10;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qz10;->a:Ll/xz10;

    iput-object p2, p0, Ll/qz10;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qz10;->a:Ll/xz10;

    iget-object p0, p0, Ll/qz10;->b:Ljava/util/ArrayList;

    invoke-static {v0, p0}, Ll/xz10;->T0(Ll/xz10;Ljava/util/ArrayList;)V

    return-void
.end method
