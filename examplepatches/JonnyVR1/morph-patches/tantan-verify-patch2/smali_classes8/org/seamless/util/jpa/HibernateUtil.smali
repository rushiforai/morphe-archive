.class public Lorg/seamless/util/jpa/HibernateUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final configuration:Lorg/hibernate/cfg/Configuration;

.field public static final sessionFactory:Lorg/hibernate/SessionFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    :try_start_0
    new-instance v0, Lorg/hibernate/cfg/Configuration;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/hibernate/cfg/Configuration;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lorg/hibernate/cfg/Configuration;->configure()Lorg/hibernate/cfg/Configuration;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Lorg/seamless/util/jpa/HibernateUtil;->configuration:Lorg/hibernate/cfg/Configuration;

    .line 11
    .line 12
    invoke-virtual {v0}, Lorg/hibernate/cfg/Configuration;->buildSessionFactory()Lorg/hibernate/SessionFactory;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, Lorg/seamless/util/jpa/HibernateUtil;->sessionFactory:Lorg/hibernate/SessionFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    invoke-static {v0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getConfiguration()Lorg/hibernate/cfg/Configuration;
    .locals 1

    .line 1
    sget-object v0, Lorg/seamless/util/jpa/HibernateUtil;->configuration:Lorg/hibernate/cfg/Configuration;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getSessionFactory()Lorg/hibernate/SessionFactory;
    .locals 1

    .line 1
    sget-object v0, Lorg/seamless/util/jpa/HibernateUtil;->sessionFactory:Lorg/hibernate/SessionFactory;

    .line 2
    .line 3
    return-object v0
.end method
