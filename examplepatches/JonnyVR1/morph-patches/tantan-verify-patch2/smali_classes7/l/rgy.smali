.class public final synthetic Ll/rgy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ugy;

.field public final synthetic b:Ll/ugy$a;


# direct methods
.method public synthetic constructor <init>(Ll/ugy;Ll/ugy$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rgy;->a:Ll/ugy;

    iput-object p2, p0, Ll/rgy;->b:Ll/ugy$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rgy;->a:Ll/ugy;

    iget-object p0, p0, Ll/rgy;->b:Ll/ugy$a;

    invoke-static {v0, p0}, Ll/ugy;->d(Ll/ugy;Ll/ugy$a;)V

    return-void
.end method
