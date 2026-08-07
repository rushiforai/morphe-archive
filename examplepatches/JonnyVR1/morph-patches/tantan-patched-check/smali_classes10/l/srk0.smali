.class public final synthetic Ll/srk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/urk0;


# direct methods
.method public synthetic constructor <init>(Ll/urk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/srk0;->a:Ll/urk0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/srk0;->a:Ll/urk0;

    invoke-static {p0}, Ll/urk0;->r4(Ll/urk0;)V

    return-void
.end method
