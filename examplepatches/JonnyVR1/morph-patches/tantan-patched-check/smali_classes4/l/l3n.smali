.class public final synthetic Ll/l3n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/n3n;


# direct methods
.method public synthetic constructor <init>(Ll/n3n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l3n;->a:Ll/n3n;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l3n;->a:Ll/n3n;

    invoke-static {p0}, Ll/n3n;->a(Ll/n3n;)V

    return-void
.end method
