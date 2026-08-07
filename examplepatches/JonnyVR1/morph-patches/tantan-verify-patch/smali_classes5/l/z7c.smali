.class public final synthetic Ll/z7c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/g8c;


# direct methods
.method public synthetic constructor <init>(Ll/g8c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z7c;->a:Ll/g8c;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z7c;->a:Ll/g8c;

    invoke-static {p0}, Ll/g8c;->a(Ll/g8c;)V

    return-void
.end method
