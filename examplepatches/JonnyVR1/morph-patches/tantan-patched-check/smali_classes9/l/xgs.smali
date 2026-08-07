.class public final synthetic Ll/xgs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/nhs;


# direct methods
.method public synthetic constructor <init>(Ll/nhs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xgs;->a:Ll/nhs;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xgs;->a:Ll/nhs;

    invoke-static {p0}, Ll/nhs;->m(Ll/nhs;)V

    return-void
.end method
