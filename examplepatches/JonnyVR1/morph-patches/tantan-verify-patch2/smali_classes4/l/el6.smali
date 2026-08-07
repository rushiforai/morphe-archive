.class public final synthetic Ll/el6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/gl6;


# direct methods
.method public synthetic constructor <init>(Ll/gl6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/el6;->a:Ll/gl6;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/el6;->a:Ll/gl6;

    invoke-static {p0}, Ll/gl6;->c(Ll/gl6;)V

    return-void
.end method
