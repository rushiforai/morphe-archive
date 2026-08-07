.class public final synthetic Ll/ngf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ogf;


# direct methods
.method public synthetic constructor <init>(Ll/ogf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ngf;->a:Ll/ogf;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ngf;->a:Ll/ogf;

    invoke-static {p0}, Ll/ogf;->m(Ll/ogf;)V

    return-void
.end method
