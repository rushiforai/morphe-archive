.class public final synthetic Ll/v420;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/w420$a;


# direct methods
.method public synthetic constructor <init>(Ll/w420$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v420;->a:Ll/w420$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v420;->a:Ll/w420$a;

    invoke-static {p0}, Ll/w420$a;->i(Ll/w420$a;)V

    return-void
.end method
