.class public final synthetic Ll/vn7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/no7;


# direct methods
.method public synthetic constructor <init>(Ll/no7;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vn7;->a:Ll/no7;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vn7;->a:Ll/no7;

    invoke-static {p0}, Ll/no7;->h3(Ll/no7;)V

    return-void
.end method
