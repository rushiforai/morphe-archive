.class public final synthetic Ll/o05;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/t05;


# direct methods
.method public synthetic constructor <init>(Ll/t05;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o05;->a:Ll/t05;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o05;->a:Ll/t05;

    invoke-static {p0}, Ll/t05;->z(Ll/t05;)V

    return-void
.end method
