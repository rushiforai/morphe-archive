.class public final synthetic Ll/ezu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/lzu0;

.field public final synthetic b:Ll/tct0;


# direct methods
.method public synthetic constructor <init>(Ll/lzu0;Ll/tct0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ezu0;->a:Ll/lzu0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ezu0;->b:Ll/tct0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ezu0;->a:Ll/lzu0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ezu0;->b:Ll/tct0;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/lzu0;->o(Ll/tct0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
