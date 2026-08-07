.class public final synthetic Ll/yez;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ffz;


# direct methods
.method public synthetic constructor <init>(Ll/ffz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yez;->a:Ll/ffz;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yez;->a:Ll/ffz;

    invoke-static {p0}, Ll/ffz;->s(Ll/ffz;)V

    return-void
.end method
