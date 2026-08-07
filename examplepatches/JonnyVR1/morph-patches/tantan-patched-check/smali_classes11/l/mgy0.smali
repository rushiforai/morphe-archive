.class public final synthetic Ll/mgy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic a:Ll/pgy0;

.field public synthetic b:Ll/d6x0;

.field public synthetic c:Landroid/app/job/JobParameters;


# direct methods
.method public synthetic constructor <init>(Ll/pgy0;Ll/d6x0;Landroid/app/job/JobParameters;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mgy0;->a:Ll/pgy0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/mgy0;->b:Ll/d6x0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/mgy0;->c:Landroid/app/job/JobParameters;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mgy0;->a:Ll/pgy0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/mgy0;->b:Ll/d6x0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/mgy0;->c:Landroid/app/job/JobParameters;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/pgy0;->f(Ll/d6x0;Landroid/app/job/JobParameters;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
