.class public final synthetic Ll/vij0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wij0;


# direct methods
.method public synthetic constructor <init>(Ll/wij0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vij0;->a:Ll/wij0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vij0;->a:Ll/wij0;

    invoke-static {p0}, Ll/wij0;->a(Ll/wij0;)V

    return-void
.end method
